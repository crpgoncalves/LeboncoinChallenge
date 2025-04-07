//
//  ImageLoaderTests.swift
//  LeboncoinChallenge
//
//  Created by Carlos Gonçalves on 07/04/2025.
//

import XCTest
@testable import LeboncoinChallenge

final class ImageLoaderTests: XCTestCase {
    
    var mockLoader: MockImageLoader!
    
    override func setUp() {
        super.setUp()
        mockLoader = MockImageLoader()
    }
    
    override func tearDown() {
        mockLoader = nil
        super.tearDown()
    }
    
    func testLoadImage_Success() {
        mockLoader.shouldReturnImage = true
        let expectation = self.expectation(description: "Image loaded")

        mockLoader.loadImage("https://example.com/image.png") { image in
            XCTAssertNotNil(image)
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1, handler: nil)
    }

    func testLoadImage_Error() {
        mockLoader.shouldReturnImage = false
        let expectation = self.expectation(description: "Image load failed")

        mockLoader.loadImage("https://example.com/image.png") { image in
            XCTAssertNil(image)
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1, handler: nil)
    }
}
