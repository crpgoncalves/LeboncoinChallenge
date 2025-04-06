//
//  ADItemViewModel.swift
//  LeboncoinChallenge
//
//  Created by Carlos Gonçalves on 06/04/2025.
//

import Foundation

class ADItemViewModel: ObservableObject {
    
    private let ad: ADModel
    
    init(ad: ADModel) {
        self.ad = ad
    }
    
    var categoryName: String {
        Localized.string(ad.category?.name)
    }
    
    var image: String {
        ad.imagesURL.thumb ?? ""
    }
    
    var title: String {
        ad.title
    }
    
    var price: String {
        PriceFormatter.formatPrice(ad.price)
    }
    
    var isUrgent: Bool {
        ad.isUrgent
    }
}
