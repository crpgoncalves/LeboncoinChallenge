//
//  ListScreenViewModelTests.swift
//  LeboncoinChallenge
//
//  Created by Carlos Gonçalves on 07/04/2025.
//

import XCTest
import Combine

@testable import LeboncoinChallenge

class ListScreenViewModelTests: XCTestCase {
    
    var viewModel: ListScreenViewModel!
    var mockGetCategoriesService: GetCategoriesServiceMock!
    var mockGetAdsService: GetAdsServiceMock!
    var mockAdCategoryAssociationService: AdCategoryAssociationService!
    var cancellables: Set<AnyCancellable>!

    
    override func setUp() {
        super.setUp()
        
        mockGetCategoriesService = GetCategoriesServiceMock()
        mockGetAdsService = GetAdsServiceMock()
        mockAdCategoryAssociationService = AdCategoryAssociationService()
        cancellables = []
        viewModel = ListScreenViewModel(
            getCategoryService: mockGetCategoriesService,
            getAdsService: mockGetAdsService,
            adCategoryAssociationService: mockAdCategoryAssociationService
        )
    }
    
    override func tearDown() {
        viewModel = nil
        mockGetCategoriesService = nil
        mockGetAdsService = nil
        mockAdCategoryAssociationService = nil
        cancellables = nil
        super.tearDown()
    }
    
    func testFetchData_WhenDataIsLoadedSuccessfully() {

        let expectation = self.expectation(description: "Data is loaded")
        viewModel.$categories.dropFirst().sink { categories in
            if categories.count > 0 {
                expectation.fulfill()
            }
        }.store(in: &cancellables)
        
        viewModel.fetchData()
        
        waitForExpectations(timeout: 2, handler: nil)
        XCTAssertEqual(viewModel.categories.count, 11)
        XCTAssertEqual(viewModel.filteredAds.count, 3)
        XCTAssertTrue(viewModel.errorMessage.isEmpty)
        XCTAssertFalse(viewModel.isLoading)
    }
    
    func testFetchData_WhenDataGetAdsReturnError() {

        mockGetAdsService.shouldReturnError = true
        
        viewModel.fetchData()

        XCTAssertEqual(viewModel.categories.count, 0)
        XCTAssertEqual(viewModel.filteredAds.count, 0)
        XCTAssertFalse(viewModel.errorMessage.isEmpty)
        XCTAssertFalse(viewModel.isLoading)
    }
    
    func testFetchData_WhenDataGetCategoriesReturnError() {

        mockGetCategoriesService.shouldReturnError = true
        
        viewModel.fetchData()
        
        XCTAssertEqual(viewModel.categories.count, 0)
        XCTAssertEqual(viewModel.filteredAds.count, 0)
        XCTAssertFalse(viewModel.errorMessage.isEmpty)
        XCTAssertFalse(viewModel.isLoading)
    }
    
    func testFilteredAds_WhenSearchTextIsEntered() {
        viewModel.fetchData()
        viewModel.searchText = "hoMmE NoIr"
        
        XCTAssertEqual(viewModel.filteredAds.count, 1) 
        XCTAssertEqual(viewModel.filteredAds.first?.title, "Statue homme noir assis en plâtre polychrome")
    }


}
