//
//  PriceFormatterTests.swift
//  LeboncoinChallenge
//
//  Created by Carlos Gonçalves on 03/04/2025.
//


import XCTest
@testable import LeboncoinChallenge

/// \u{00a0}
/// non-breakable whitespace unicode
class PriceFormatterTests: XCTestCase {
    
    func testFormat_PriceWithDecimals() {
        let formattedPrice = PriceFormatter.formatPrice(199.99)
        XCTAssertEqual(formattedPrice, "199,99\u{00a0}€")
    }

    func testFormat_PriceWithoutDecimals() {
        let formattedPrice = PriceFormatter.formatPrice(200.00)
        XCTAssertEqual(formattedPrice, "200\u{00a0}€")
    }

    func testFormat_PriceWithIntegerValue() {
        let formattedPrice = PriceFormatter.formatPrice(100)
        XCTAssertEqual(formattedPrice, "100\u{00a0}€")
    }

    func testFormat_PriceWithZero() {
        let formattedPrice = PriceFormatter.formatPrice(0.00)
        XCTAssertEqual(formattedPrice, "0\u{00a0}€")
    }
    
    
    func testFormat_PriceWithSmallValue() {
        let formattedPrice = PriceFormatter.formatPrice(0.99)
        XCTAssertEqual(formattedPrice, "0,99\u{00a0}€")
    }
    
    func testFormat_PriceWithSmallDecimalValue() {
        let formattedPrice = PriceFormatter.formatPrice(1.5)
        XCTAssertEqual(formattedPrice, "1,5\u{00a0}€")
    }

    func testFormat_PriceWithLargeValue() {
        let formattedPrice = PriceFormatter.formatPrice(99999.99)
        XCTAssertEqual(formattedPrice, "99\u{00a0}999,99\u{00a0}€")
    }
    
    func testFormat_NegativePrice() {
        let formattedPrice = PriceFormatter.formatPrice(-100)
        XCTAssertEqual(formattedPrice, "-100\u{00a0}€")
    }
}
