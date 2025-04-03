//
//  GetAdsService.swift
//  LebocoinChallenge
//
//  Created by Carlos Gonçalves on 03/04/2025.
//

import Combine

protocol GetAdsServiceProtocol {
    var networkClient: NetworkRequestable { get }
    func getAds() -> AnyPublisher<[ADModel], Error>
}

class GetAdsServiceProtocolService: GetAdsServiceProtocol {
    public var networkClient: NetworkRequestable
    
    public init(networkClient: NetworkRequestable = NetworkClient()) {
        self.networkClient = networkClient
    }
    
    public func getAds() -> AnyPublisher<[ADModel], Error> {
        return networkClient.request(GetAdsEndpoint(), responseType: [ADModel].self)
    }
}
