//
//  AdCategoryAssociationServiceProtocol.swift
//  LeboncoinChallenge
//
//  Created by Carlos Gonçalves on 03/04/2025.
//


protocol AdCategoryAssociationServiceProtocol {
    func associateCategoriesToAds(ads: [ADModel], categories: [ADCategory]) -> [ADModel]
}

class AdCategoryAssociationService: AdCategoryAssociationServiceProtocol {
    func associateCategoriesToAds(ads: [ADModel], categories: [ADCategory]) -> [ADModel] {
        return ads.map { ad in
            var adWithCategory = ad
            if let category = categories.first(where: { $0.id == ad.categoryId }) {
                adWithCategory.category = category
            }
            return adWithCategory
        }
    }
}
