//
//  UIKitAppTheme.swift
//  LeboncoinChallenge
//
//  Created by Carlos Gonçalves on 07/04/2025.
//

import UIKit

struct UIKitAppTheme {
    let primaryColor: UIColor
    let secondaryTextColor: UIColor
    let backgroundColor: UIColor
    let textColor: UIColor

    static func current(for userInterfaceStyle: UIUserInterfaceStyle) -> UIKitAppTheme {
        switch userInterfaceStyle {
        case .dark:
            return UIKitAppTheme(
                primaryColor: .blue,
                secondaryTextColor: .gray,
                backgroundColor: .black,
                textColor: .white
            )
        default:
            return UIKitAppTheme(
                primaryColor: .blue,
                secondaryTextColor: .gray,
                backgroundColor: .white,
                textColor: .black
            )
        }
    }
}
