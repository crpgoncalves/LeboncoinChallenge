
//
//  PriceFormatter.swift
//  LeboncoinChallenge
//
//  Created by Carlos Gonçalves on 03/04/2025.
//

import Foundation

enum PriceFormatter {
    private static var formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    static func formatPrice(_ price: Double, locale: Locale = Locale.current) -> String {
        formatter.locale = locale
        return formatter.string(from: NSNumber(value: price)) ?? "\(price)"
    }
}

