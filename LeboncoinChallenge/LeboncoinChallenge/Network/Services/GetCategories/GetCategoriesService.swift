//
//  GetCategoriesService.swift
//  LeboncoinChallenge
//
//  Created by Carlos Gonçalves on 02/04/2025.
//

import Combine

protocol GetCategoriesServiceProtocol {
    var networkClient: NetworkRequestable { get }
    func getCategories() -> AnyPublisher<[ADCategory], Error>
}

class GetCategoriesService: GetCategoriesServiceProtocol {
    public var networkClient: NetworkRequestable
    
    public init(networkClient: NetworkRequestable = NetworkClient()) {
        self.networkClient = networkClient
    }
    
    public func getCategories() -> AnyPublisher<[ADCategory], Error> {
        return networkClient.request(GetCategoryEndpoint(), responseType: [ADCategory].self)
    }
}
