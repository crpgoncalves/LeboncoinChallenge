//
//  GetAdsMockResponse.swift
//  LeboncoinChallenge
//
//  Created by Carlos Gonçalves on 03/04/2025.
//

struct GetAdsMock {
    static var mock: [ADModel] {
        return [
            ADModel(
                id: 1461267313,
                categoryId: 4,
                title: "Statue homme noir assis en plâtre polychrome",
                description: "Magnifique Statuette homme noir assis fumant le cigare en terre cuite et plâtre polychrome réalisée à la main. Poids 1,900 kg en très bon état, aucun éclat ! Hauteur 18 cm Largeur : 16 cm Profondeur : 18cm Création Jacky SAMSON OPTIMUM PARIS Possibilité de remise sur place en gare de Fontainebleau ou Paris gare de Lyon, en espèces (heure et jour du rendez-vous au choix). Envoi possible ! Si cet article est toujours visible sur le site c'est qu'il est encore disponible",
                price: 140.00,
                imagesURL: ImagesURL(
                    small: "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-small/2c9563bbe85f12a5dcaeb2c40989182463270404.jpg",
                    thumb: "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-thumb/2c9563bbe85f12a5dcaeb2c40989182463270404.jpg"
                ),
                creationDate: "2019-11-05T15:56:59+0000",
                isUrgent: false
            ),
            ADModel(
                id: 1691247255,
                categoryId: 8,
                title: "Pc portable hp elitebook 820 g1 core i5 4 go ram 250 go hdd",
                description: "PC PORTABLE HP ELITEBOOK 820 G1 - Intel Core i5 4300M, 4 GO DDR3, 320 GO SATA, Windows 7 Pro – 64bits, Reconditionné, Garantie 6 Mois. Options d'amélioration disponibles : RAM jusqu'à 8 GO, stockage HDD ou SSD. Disponible en boutique sur Paris avec plus de 300 modèles en stock.",
                price: 199.00,
                imagesURL: ImagesURL(
                    small: "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-small/633f278423b9aa6b04fa9cc954079befd294473f.jpg",
                    thumb: "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-thumb/633f278423b9aa6b04fa9cc954079befd294473f.jpg"
                ),
                creationDate: "2019-10-16T17:10:20+0000",
                isUrgent: true
            ),
            ADModel(
                id: 1664493117,
                categoryId: 9,
                title: "Professeur natif d'espagnol à domicile",
                description: "Doctorant espagnol avec expérience d'enseignement, propose des cours particuliers à domicile à Paris pour tous niveaux et âges. Adaptation à vos besoins pour améliorer l'expression orale, la grammaire, le vocabulaire et la compréhension écrite.",
                price: 25.00,
                imagesURL: ImagesURL(
                    small: nil,
                    thumb: nil
                ),
                creationDate: "2019-11-05T15:56:55+0000",
                isUrgent: false
            )
        ]
    }
}
