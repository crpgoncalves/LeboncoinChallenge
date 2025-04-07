//
//  NetworkConfigurationProvider.swift
//  LeboncoinChallenge
//
//  Created by Carlos Gonçalves on 02/04/2025.
//

import Foundation

protocol NetworkConfigurationProviding {
    var baseURL: URL { get }
}

struct NetworkConfigurationProvider: NetworkConfigurationProviding {
    
    var baseURL: URL {
        if let urlString = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String,
           let url = URL(string: urlString) {
            return url
        }
        fatalError(" [NetworkConfigurationProvider] BASE_URL is missing or invalid in Build Settings, check your Info.plist")
    }
}
