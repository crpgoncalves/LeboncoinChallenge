//
//  ListScreenViewModel.swift
//  LebocoinChallenge
//
//  Created by Carlos Gonçalves on 02/04/2025.
//

import Combine
import SwiftUI

class ListScreenViewModel: ObservableObject {
    @Published var categories = [ADCategory]()
    @Published var ads = [ADModel]()

    private let getCategoryService: GetCategoriesServiceProtocol
    private let getAdsService: GetAdsServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(getCategoryService: GetCategoriesServiceProtocol = GetCategoriesService(),
         getAdsService: GetAdsServiceProtocol = GetAdsServiceProtocolService()) {
        self.getCategoryService = getCategoryService
        self.getAdsService = getAdsService
    }
    
    func fetchCategories() {
        getCategoryService.getCategories()
            .sink(receiveCompletion: { [weak self] completion in
                if case .failure(let error) = completion {
                    print(error.localizedDescription)
                }
            }, receiveValue: { [weak self] response in
                self?.categories = response
            })
            .store(in: &cancellables)
        
        getAdsService.getAds()
            .sink(receiveCompletion: { [weak self] completion in
                if case .failure(let error) = completion {
                    print(error.localizedDescription)
                }
            }, receiveValue: { [weak self] response in
                self?.ads = response
            })
            .store(in: &cancellables)

    }
}
