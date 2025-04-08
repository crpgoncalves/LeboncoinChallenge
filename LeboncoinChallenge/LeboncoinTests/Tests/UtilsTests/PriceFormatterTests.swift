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
/// Those Unit-tests were defined assuming that iPhone is using PT as app locale
class PriceFormatterTests: XCTestCase {
    
    var locale: Locale!
    
    override func setUp() {
        super.setUp()
        locale = Locale(identifier: "pt_PT")
    }

    override func tearDown() {
        locale = nil
        super.tearDown()
    }
    
    func testFormat_PriceWithDecimals() {
        let formattedPrice = PriceFormatter.formatPrice(199.99, locale: locale)
        XCTAssertEqual(formattedPrice, "199,99\u{00a0}€")
    }

    func testFormat_PriceWithoutDecimals() {
        let formattedPrice = PriceFormatter.formatPrice(200.00, locale: locale)
        XCTAssertEqual(formattedPrice, "200\u{00a0}€")
    }

    func testFormat_PriceWithIntegerValue() {
        let formattedPrice = PriceFormatter.formatPrice(100, locale: locale)
        XCTAssertEqual(formattedPrice, "100\u{00a0}€")
    }

    func testFormat_PriceWithZero() {
        let formattedPrice = PriceFormatter.formatPrice(0.00, locale: locale)
        XCTAssertEqual(formattedPrice, "0\u{00a0}€")
    }
    
    
    func testFormat_PriceWithSmallValue() {
        let formattedPrice = PriceFormatter.formatPrice(0.99, locale: locale)
        XCTAssertEqual(formattedPrice, "0,99\u{00a0}€")
    }
    
    func testFormat_PriceWithSmallDecimalValue() {
        let formattedPrice = PriceFormatter.formatPrice(1.5, locale: locale)
        XCTAssertEqual(formattedPrice, "1,5\u{00a0}€")
    }

    func testFormat_PriceWithLargeValue() {
        let formattedPrice = PriceFormatter.formatPrice(99999.99, locale: locale)
        XCTAssertEqual(formattedPrice, "99\u{00a0}999,99\u{00a0}€")
    }
    
    func testFormat_NegativePrice() {
        let formattedPrice = PriceFormatter.formatPrice(-100, locale: locale)
        XCTAssertEqual(formattedPrice, "-100\u{00a0}€")
    }
}
