//
//  DateHelper.swift
//  LeboncoinChallenge
//
//  Created by Carlos Gonçalves on 06/04/2025.
//

import Foundation

struct DateHelper {
    
    private static var inputDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter
    }()
    
    private static var outputDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm"
        return formatter
    }()
    
    private static func formatDate(_ date: Date) -> String {
        return outputDateFormatter.string(from: date)
    }
    
    static func formatDate(from dateString: String) -> String {
        if let date = inputDateFormatter.date(from: dateString) {
            return outputDateFormatter.string(from: date)
        }
        
        print("[DateHelper] Unable to format date - \(dateString))")
        return dateString
    }

}
