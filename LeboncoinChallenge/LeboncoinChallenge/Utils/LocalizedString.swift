//
//  LocalizedString.swift
//  LeboncoinChallenge
//
//  Created by Carlos Gonçalves on 03/04/2025.
//

import Foundation

/// Allow to localize some strings like Categories name for example
enum Localized {
    static func string(_ key: String?, _ comment: String? = nil) -> String {
        guard let key = key else {
            return ""
        }
        return NSLocalizedString(key, comment: comment ?? "")
    }
}
