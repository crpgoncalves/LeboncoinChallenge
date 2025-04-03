//
//  GetCategoriesServiceTests.swift
//  LebocoinChallenge
//
//  Created by Carlos Gonçalves on 02/04/2025.
//

import Combine
import XCTest

@testable import LebocoinChallenge

class GetCategoriesServiceTests: XCTestCase {
    
    var getCategoriesServiceMock: GetCategoriesServiceMock!
    var cancellables: Set<AnyCancellable> = []
    
    override func setUp() {
        super.setUp()
        getCategoriesServiceMock = GetCategoriesServiceMock()
    }
    
    override func tearDown() {
        getCategoriesServiceMock = nil
        cancellables.removeAll()
        super.tearDown()
    }
    
    func testFetch_SuccessfulResponse() {
        let expectation = XCTestExpectation(description: "Successful network response")
        
        getCategoriesServiceMock.getCategories()
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    XCTFail("Expected success but got failure: \(error.localizedDescription)")
                }
            }, receiveValue: { categories in
                XCTAssertEqual(categories.count, 11, "It should return 11 Categories from the mock")
                expectation.fulfill()
            })
            .store(in: &cancellables)

        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testFetch_FailureResponse() {
        let expectation = XCTestExpectation(description: "Failed network response")
        getCategoriesServiceMock.shouldReturnError = true
        
        getCategoriesServiceMock.getCategories()
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    XCTAssertEqual(error as? NetworkError, NetworkError.custom("GetCategoriesServiceMock - shouldReturnError"))
                    expectation.fulfill()
                }
            }, receiveValue: { _ in
                XCTFail("Expected failure but got success")
            })
            .store(in: &cancellables)

        
        wait(for: [expectation], timeout: 5.0)
    }
}
