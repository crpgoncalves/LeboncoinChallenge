//
//  AppTheme.swift
//  LeboncoinChallenge
//
//  Created by Carlos Gonçalves on 04/04/2025.
//

import SwiftUI

struct AppTheme {
    
    let primaryColor: Color
    let secondaryColor: Color
    let backgroundColor: Color
    let textColor: Color

    static func current(for colorScheme: ColorScheme) -> AppTheme {
        switch colorScheme {
        case .dark:
            return AppTheme(
                primaryColor: Color.blue,
                secondaryColor: Color.gray,
                backgroundColor: Color.black,
                textColor: Color.white
            )
        default:
            return AppTheme(
                primaryColor: Color.blue,
                secondaryColor: Color.gray,
                backgroundColor: Color.white,
                textColor: Color.black
            )
        }
    }
}
