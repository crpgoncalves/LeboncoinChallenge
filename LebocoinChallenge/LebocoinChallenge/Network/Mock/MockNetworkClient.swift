//
//  MockNetworkClient.swift
//  LeboncoinChallenge
//
//  Created by Carlos Gonçalves on 02/04/2025.
//

import Combine
import Foundation

final class MockNetworkClient: NetworkRequestable {
    
    var mockEndpoint: Endpoint = MockEndpoint()
    var shouldReturnError = false
    var mockData: Data?
    var mockError: NetworkError = .custom("Mocked Error")
    
    func request<T: Decodable>(_ endpoint: Endpoint, responseType: T.Type) -> AnyPublisher<T, Error> {
        if shouldReturnError {
            return Fail(error: mockError).eraseToAnyPublisher()
        }
        
        guard let data = mockData else {
            return Fail(error: mockError).eraseToAnyPublisher()
        }
        
        return Just(data)
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { _ in self.mockError }
            .eraseToAnyPublisher()
    }
}
