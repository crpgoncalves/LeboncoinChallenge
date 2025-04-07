//
//  ImageLoader.swift
//  LeboncoinChallenge
//
//  Created by Carlos Gonçalves on 07/04/2025.
//

import UIKit

final class ImageLoader: ImageLoading {
    
    static let shared = ImageLoader()

    private let imageCache = NSCache<NSString, UIImage>()

    private init() {}

    func loadImage(_ urlString: String?, completion: @escaping (UIImage?) -> Void) {
        
        guard let string = urlString,
              let url = URL(string: string) else {
            completion(nil)
            return
        }
        
        if let cachedImage = imageCache.object(forKey: string as NSString) {
            completion(cachedImage)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let data = data,
                   let image = UIImage(data: data) {
                    self.imageCache.setObject(image, forKey: string as NSString)
                    completion(image)
                } else {
                    completion(nil)
                }
            }
        }.resume()
    }
}


