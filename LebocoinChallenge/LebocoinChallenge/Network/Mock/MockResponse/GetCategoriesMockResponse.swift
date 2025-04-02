//
//  GetCategoriesMockResponse.swift
//  LebocoinChallenge
//
//  Created by Carlos Gonçalves on 02/04/2025.
//

struct GetCategoriesMock {
    static var mock: [LCCategory] {
        return [
            LCCategory(id: 1, name: "Véhicule"),
            LCCategory(id: 2, name: "Mode"),
            LCCategory(id: 3, name: "Bricolage"),
            LCCategory(id: 4, name: "Maison"),
            LCCategory(id: 5, name: "Loisirs"),
            LCCategory(id: 6, name: "Immobilier"),
            LCCategory(id: 7, name: "Livres/CD/DVD"),
            LCCategory(id: 8, name: "Multimédia"),
            LCCategory(id: 9, name: "Service"),
            LCCategory(id: 10, name: "Animaux"),
            LCCategory(id: 11, name: "Enfants")
        ]
    }
}
