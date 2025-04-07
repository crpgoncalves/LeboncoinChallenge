//
//  ListScreenViewModel.swift
//  LeboncoinChallenge
//
//  Created by Carlos Gonçalves on 02/04/2025.
//

import Combine
import SwiftUI

class ListScreenViewModel: ObservableObject {
    
    @Published var categories = [ADCategory]()
    @Published var selectedCategories: Set<Int> = []
    @Published var searchText = ""
    @Published var isLoading = false
    @Published var errorMessage = ""

    var filteredAds: [ADModel] {
        let filteredByCategory = ads.filter { ad in
            selectedCategories.isEmpty || selectedCategories.contains(ad.categoryId)
        }
        
        return filteredByCategory.filter { ad in
            searchText.isEmpty || ad.title.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    private var ads = [ADModel]()
    private let getCategoryService: GetCategoriesServiceProtocol
    private let getAdsService: GetAdsServiceProtocol
    private let adCategoryAssociationService: AdCategoryAssociationServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(getCategoryService: GetCategoriesServiceProtocol = GetCategoriesService(),
         getAdsService: GetAdsServiceProtocol = GetAdsServiceProtocolService(),
         adCategoryAssociationService: AdCategoryAssociationServiceProtocol = AdCategoryAssociationService()) {
        self.getCategoryService = getCategoryService
        self.getAdsService = getAdsService
        self.adCategoryAssociationService = adCategoryAssociationService
    }
    
    func fetchData() {
        
        guard ads.isEmpty || categories.isEmpty else {
            //once we dont support pagination, just request data when dataSource is empty
            return
        }
    
        isLoading = true
        let categoriesPublisher = getCategoryService.getCategories()
        let adsPublisher = getAdsService.getAds()
        
        Publishers.Zip(categoriesPublisher, adsPublisher)
            .sink(receiveCompletion: { [weak self] completion in
                
                if case .failure(let error) = completion {
                    print(error.localizedDescription)
                    self?.isLoading = false
                    self?.errorMessage = Localized.string("list_screen.request.error")
                }

            }, receiveValue: { [weak self] categoriesResponse, adsResponse in
                self?.categories = categoriesResponse.sorted {
                    //If user changes language during the execution it wont be sorted
                    Localized.string($0.name).localizedCaseInsensitiveCompare(Localized.string($1.name)) == .orderedAscending
                }
                self?.ads = adsResponse
                self?.associateCategoriesToAds()
                self?.isLoading = false
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
    
    func resetFilter() {
        selectedCategories.removeAll()
    }

    func resetSearch() {
        searchText = ""
    }
}

extension ListScreenViewModel {

    private func associateCategoriesToAds() {
        ads = adCategoryAssociationService.associateCategoriesToAds(ads: ads, categories: categories)
    }
}
