//
//  GetCategoriesServiceMock.swift
//  LeboncoinChallenge
//
//  Created by Carlos Gonçalves on 02/04/2025.
//
import Combine

class GetCategoriesServiceMock: GetCategoriesServiceProtocol {

    var networkClient: any NetworkRequestable
    var shouldReturnError = false

    init(networkClient: any NetworkRequestable = MockNetworkClient()) {
        self.networkClient = networkClient
    }
    
    func getCategories() -> AnyPublisher<[ADCategory], any Error> {
        if shouldReturnError {
            return Fail(error: NetworkError.custom("GetCategoriesServiceMock - shouldReturnError")).eraseToAnyPublisher()
        }
        
        return Just(GetCategoriesMock.mock)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
