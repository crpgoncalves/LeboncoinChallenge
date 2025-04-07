//
//  ImageLoading.swift
//  LeboncoinChallenge
//
//  Created by Carlos Gonçalves on 07/04/2025.
//
import UIKit

protocol ImageLoading {
    func loadImage(_ urlString: String, completion: @escaping (UIImage?) -> Void)
}
