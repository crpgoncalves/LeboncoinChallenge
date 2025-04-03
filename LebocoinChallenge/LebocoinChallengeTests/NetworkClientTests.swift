//
//  NetworkClientTests.swift
//  LebocoinChallenge
//
//  Created by Carlos Gonçalves on 02/04/2025.
//

import Combine
import XCTest

@testable import LebocoinChallenge

class NetworkClientTests: XCTestCase {
    
    var mockNetworkClient: MockNetworkClient!
    var cancellables: Set<AnyCancellable> = []
    
    override func setUp() {
        super.setUp()
        mockNetworkClient = MockNetworkClient()
    }
    
    override func tearDown() {
        mockNetworkClient = nil
        cancellables.removeAll()
        super.tearDown()
    }
    
    func testFetch_SuccessfulResponse() {
        let expectation = XCTestExpectation(description: "Successful network response")
        
        mockNetworkClient.mockData = try? JSONEncoder().encode(GetCategoriesMock.mock)
        
        mockNetworkClient.request(mockNetworkClient.mockEndpoint, responseType: [ADCategory].self)
            .sink(receiveCompletion: { completion in
                if case .failure = completion {
                    XCTFail("Expected success but got failure")
                }
            }, receiveValue: { response in
                XCTAssertEqual(response.count, 11, "It should return 3 Categories from the mock, same reponse type")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testFetch_FailureResponse() {
        let expectation = XCTestExpectation(description: "Failed network response")
        mockNetworkClient.shouldReturnError = true
        
        mockNetworkClient.request(mockNetworkClient.mockEndpoint, responseType: [ADCategory].self)
            .sink(receiveCompletion: { [weak self] completion in
                if case .failure(let error) = completion {
                    XCTAssertEqual(error as? NetworkError, self?.mockNetworkClient.mockError)
                    expectation.fulfill()
                }
            }, receiveValue: { _ in
                XCTFail("Expected failure but got success")
            })
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testFetch_FailureResponse_NoData() {
        let expectation = XCTestExpectation(description: "Failed network response")
        
        mockNetworkClient.request(mockNetworkClient.mockEndpoint, responseType: [ADCategory].self)
            .sink(receiveCompletion: { [weak self] completion in
                if case .failure(let error) = completion {
                    XCTAssertEqual(error as? NetworkError, self?.mockNetworkClient.mockError)
                    expectation.fulfill()
                }
            }, receiveValue: { _ in
                XCTFail("Expected failure but got success")
            })
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 5.0)
    }
}
