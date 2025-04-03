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
        guard let urlString = ProcessInfo.processInfo.environment["BASE_URL"],
              let url = URL(string: urlString) else {
            fatalError(" [NetworkConfigurationProvider] BASE_URL is missing or invalid in Build Settings, check your Config.xcconfig")
        }
    
        return url
    }
}
