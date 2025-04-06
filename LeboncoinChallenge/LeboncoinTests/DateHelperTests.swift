//
//  DateHelperTests.swift
//  LeboncoinChallenge
//
//  Created by Carlos Gonçalves on 06/04/2025.
//

import XCTest

@testable import LeboncoinChallenge

final class DateHelperTests: XCTestCase {

    func testValidDateStringConversion() {
        let input = "2019-11-05T15:55:47+0000"
        let expected = "05/11/2019 15:55"
        let result = DateHelper.formatDate(from: input)
        
        XCTAssertEqual(result, expected)
    }
    
    func testInvalidDateStringReturnsOriginal() {
        let invalidInput = "invalid-date"
        let result = DateHelper.formatDate(from: invalidInput)
        
        XCTAssertEqual(result, invalidInput)
    }

    func testEmptyDateStringReturnsOriginal() {
        let emptyInput = ""
        let result = DateHelper.formatDate(from: emptyInput)
        
        XCTAssertEqual(result, emptyInput)
    }
    
    func testDifferentTimezoneStillParsesCorrectly() {
        let input = "2020-12-25T23:00:00+0000"
        let expected = "25/12/2020 23:00"
        let result = DateHelper.formatDate(from: input)
        
        XCTAssertEqual(result, expected)
    }
}
