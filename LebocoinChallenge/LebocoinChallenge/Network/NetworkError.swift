//
//  NetworkError.swift
//  LebocoinChallenge
//
//  Created by Carlos Gonçalves on 02/04/2025.
//

enum NetworkError: Error, Equatable {
    case badUrl
    case invalidResponse
    case noData
    case decodingError
    case custom(String)
}
