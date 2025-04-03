//
//  NetworkClient.swift
//  LeboncoinChallenge
//
//  Created by Carlos Gonçalves on 02/04/2025.
//

import Combine
import Foundation
import SwiftUI

protocol NetworkRequestable {
    func request<T: Decodable>(_ endpoint: Endpoint, responseType: T.Type) -> AnyPublisher<T, Error>
}

final class NetworkClient: NetworkRequestable {
    
    private let session: URLSession
    private let configuration: NetworkConfigurationProviding

    public init(session: URLSession = .shared,
                configuration: NetworkConfigurationProviding = NetworkConfigurationProvider()) {
        self.session = session
        self.configuration = configuration
    }
    
    func request<T: Decodable>(_ endpoint: Endpoint, responseType: T.Type) -> AnyPublisher<T, Error> {
        
        guard var urlComponents = URLComponents(url: configuration.baseURL, resolvingAgainstBaseURL: true) else {
            return Fail(error: NetworkError.badUrl).eraseToAnyPublisher()
        }
        
        urlComponents.path = urlComponents.path.appending(endpoint.path)
        
        if let endpointQueryParameters = endpoint.queryParameters {
            var queryItems = [URLQueryItem]()
            
            queryItems.append(contentsOf: endpointQueryParameters.map { URLQueryItem(name: $0.key, value: $0.value) })
            
            urlComponents.queryItems = queryItems
        }

        guard let url = urlComponents.url else {
            return Fail(error: NetworkError.badUrl).eraseToAnyPublisher()
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method.rawValue
        urlRequest.httpBody = endpoint.body
        endpoint.headers?.forEach { urlRequest.setValue($0.value, forHTTPHeaderField: $0.key) }
        
        print("[NetworkClient] - Will request: \(urlRequest)")
        
        return session.dataTaskPublisher(for: urlRequest)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw NetworkError.invalidResponse
                }
                
                guard (200...299).contains(httpResponse.statusCode) else {
                    print("[NetworkClient] - HTTP Error: \(httpResponse.statusCode)")
                    throw NetworkError.custom("HTTP Error: \(httpResponse.statusCode)")
                }
                
                return data
            }
            .retry(3)
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error -> NetworkError in
                print("[NetworkClient] - Error: \(error.localizedDescription)")
                if let decodingError = error as? DecodingError {
                    switch decodingError {
                    case .typeMismatch(let key, let context):
                        print("[DecodingError] Type mismatch for key '\(key)': \(context.debugDescription)")
                    case .valueNotFound(let key, let context):
                        print("[DecodingError] Value not found for key '\(key)': \(context.debugDescription)")
                    case .keyNotFound(let key, let context):
                        print("[DecodingError] Key '\(key)' not found: \(context.debugDescription)")
                    case .dataCorrupted(let context):
                        print("[DecodingError] Data corrupted: \(context.debugDescription)")
                    @unknown default:
                        print("[DecodingError] Unknown error")
                    }
                    return NetworkError.decodingError
                }
                    
                return NetworkError.custom("Network Error: \(error.localizedDescription)")
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

