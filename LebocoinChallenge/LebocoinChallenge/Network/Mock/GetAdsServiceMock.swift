//
//  GetAdsServiceMock.swift
//  LeboncoinChallenge
//
//  Created by Carlos Gonçalves on 03/04/2025.
//

import Combine

class GetAdsServiceMock: GetAdsServiceProtocol {

    var networkClient: any NetworkRequestable
    var shouldReturnError = false

    init(networkClient: any NetworkRequestable = MockNetworkClient()) {
        self.networkClient = networkClient
    }
    
    func getAds() -> AnyPublisher<[ADModel], any Error> {
        if shouldReturnError {
            return Fail(error: NetworkError.custom("GetAdsServiceMock - shouldReturnError")).eraseToAnyPublisher()
        }
        
        return Just(GetAdsMock.mock)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
