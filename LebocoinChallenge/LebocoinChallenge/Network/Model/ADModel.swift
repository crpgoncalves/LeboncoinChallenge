//
//  ADModel.swift
//  LebocoinChallenge
//
//  Created by Carlos Gonçalves on 03/04/2025.
//

import Foundation

/*
 {
    "id":1701990543,
    "category_id":2,
    "title":"Pantalon jogging homme Hollister",
    "description":"- Pantalon type jogging pour Homme - Marque Hollister - Taille M",
    "price":20.00,
    "images_url":{

    },
    "creation_date":"2019-11-05T20:00:52+0000",
    "is_urgent":false
 }
 */
struct ADModel: Codable {
    let id: Int
    let categoryId: Int
    let title: String
    let description: String
    let price: Double
    let imagesURL: ImagesURL
    let creationDate: String
    let isUrgent: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case categoryId = "category_id"
        case title
        case description
        case price
        case imagesURL = "images_url"
        case creationDate = "creation_date"
        case isUrgent = "is_urgent"
    }
}

struct ImagesURL: Codable {
    let small: String?
    let thumb: String?
}

