
//
//  PriceFormatter.swift
//  LebocoinChallenge
//
//  Created by Carlos Gonçalves on 03/04/2025.
//

import Foundation

struct PriceFormatter {
    
    private static var formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    static func formatPrice(_ price: Double) -> String {
        return formatter.string(from: NSNumber(value: price)) ?? "\(price)"
    }
}

