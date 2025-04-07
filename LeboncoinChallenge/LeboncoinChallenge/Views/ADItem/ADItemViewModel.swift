//
//  ADItemViewModel.swift
//  LeboncoinChallenge
//
//  Created by Carlos Gonçalves on 06/04/2025.
//

import Foundation
import UIKit

class ADItemViewModel: ObservableObject {
    
    private let ad: ADModel
    private let imageLoader: ImageLoading
    
    init(ad: ADModel,
         imageLoader: ImageLoading = ImageLoader.shared) {
        self.ad = ad
        self.imageLoader = imageLoader
    }
    
    var description: String {
        ad.description
    }
    
    var date: String {
        Localized.string("ad_details_screen.created.at:") + DateHelper.formatDate(from: ad.creationDate)
    }
    var categoryName: String {
        Localized.string(ad.category?.name)
    }
    
    var image: String? {
        ad.imagesURL.thumb
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
    
    func loadImage(completion: @escaping (UIImage?) -> Void) {
        imageLoader.loadImage(ad.imagesURL.thumb) { image in
            completion(image)
        }
    }
}
