//
//  GetAdsServiceTests.swift
//  LebocoinChallenge
//
//  Created by Carlos Gonçalves on 03/04/2025.
//

import Combine
import XCTest

@testable import LebocoinChallenge

class GetAdsServiceTests: XCTestCase {
    
    var getAdsServiceMock: GetAdsServiceMock!
    var cancellables: Set<AnyCancellable> = []
    
    override func setUp() {
        super.setUp()
        getAdsServiceMock = GetAdsServiceMock()
    }
    
    override func tearDown() {
        getAdsServiceMock = nil
        cancellables.removeAll()
        super.tearDown()
    }
    
    func testFetch_SuccessfulResponse() {
        let expectation = XCTestExpectation(description: "Successful network response")
        
        getAdsServiceMock.getAds()
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    XCTFail("Expected success but got failure: \(error.localizedDescription)")
                }
            }, receiveValue: { ads in
                XCTAssertEqual(ads.count, 3)
                expectation.fulfill()
            })
            .store(in: &cancellables)

        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testFetch_FailureResponse() {
        let expectation = XCTestExpectation(description: "Failed network response")
        getAdsServiceMock.shouldReturnError = true
        
        getAdsServiceMock.getAds()
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    XCTAssertEqual(error as? NetworkError, NetworkError.custom("GetAdsServiceMock - shouldReturnError"))
                    expectation.fulfill()
                }
            }, receiveValue: { _ in
                XCTFail("Expected failure but got success")
            })
            .store(in: &cancellables)

        
        wait(for: [expectation], timeout: 5.0)
    }
}
