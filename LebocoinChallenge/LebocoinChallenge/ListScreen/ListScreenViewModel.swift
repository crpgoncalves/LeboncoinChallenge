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
    @Published var selectedCategories: Set<Int> = []
    
    var filteredAds: [ADModel] {
        if selectedCategories.isEmpty {
            return ads
        } else {
            return ads.filter { selectedCategories.contains($0.categoryId) }
        }
    }

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
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print(error.localizedDescription)
                }
            }, receiveValue: { [weak self] response in
                self?.categories = response
            })
            .store(in: &cancellables)
        
        getAdsService.getAds()
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print(error.localizedDescription)
                }
            }, receiveValue: { [weak self] response in
                self?.ads = response
            })
            .store(in: &cancellables)
        
    }
    
    func toggleCategorySelection(_ categoryId: Int) {
        if selectedCategories.contains(categoryId) {
            selectedCategories.remove(categoryId)
        } else {
            selectedCategories.insert(categoryId)
        }
    }

}
