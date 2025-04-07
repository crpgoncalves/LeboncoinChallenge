//
//  MockImageLoader.swift
//  LeboncoinChallenge
//
//  Created by Carlos Gonçalves on 07/04/2025.
//

import UIKit

final class MockImageLoader: ImageLoading {
    var shouldReturnImage = true

    func loadImage(_ urlString: String, completion: @escaping (UIImage?) -> Void) {
        let image = shouldReturnImage ? UIImage() : nil
        completion(image)
    }

}
