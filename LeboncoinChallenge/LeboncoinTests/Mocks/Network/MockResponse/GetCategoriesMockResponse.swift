//
//  GetCategoriesMockResponse.swift
//  LeboncoinChallenge
//
//  Created by Carlos Gonçalves on 02/04/2025.
//

struct GetCategoriesMock {
    static var mock: [ADCategory] {
        return [
            ADCategory(id: 1, name: "Véhicule"),
            ADCategory(id: 2, name: "Mode"),
            ADCategory(id: 3, name: "Bricolage"),
            ADCategory(id: 4, name: "Maison"),
            ADCategory(id: 5, name: "Loisirs"),
            ADCategory(id: 6, name: "Immobilier"),
            ADCategory(id: 7, name: "Livres/CD/DVD"),
            ADCategory(id: 8, name: "Multimédia"),
            ADCategory(id: 9, name: "Service"),
            ADCategory(id: 10, name: "Animaux"),
            ADCategory(id: 11, name: "Enfants")
        ]
    }
}
