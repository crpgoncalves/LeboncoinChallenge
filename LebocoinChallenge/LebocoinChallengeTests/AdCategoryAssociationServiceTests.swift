//
//  AdCategoryAssociationServiceTests.swift
//  LebocoinChallenge
//
//  Created by Carlos Gonçalves on 03/04/2025.
//


import XCTest

@testable import LebocoinChallenge

class AdCategoryAssociationServiceTests: XCTestCase {

    var adCategoryAssociationService: AdCategoryAssociationService!
    var ads: [ADModel]!
    var categories: [ADCategory]!
    
    override func setUp() {
        super.setUp()
        
        adCategoryAssociationService = AdCategoryAssociationService()
        
        categories = [
            ADCategory(id: 1, name: "Electronics"),
            ADCategory(id: 2, name: "Furniture")
        ]
        
        ads = [
            ADModel(id: 1,
                    categoryId: 1,
                    title: "Laptop",
                    description: "A powerful laptop",
                    price: 1200,
                    imagesURL: ImagesURL(small: nil, thumb: nil),
                    creationDate: "2023-04-01T17:10:20+0000",
                    isUrgent: false),
            ADModel(id: 2,
                    categoryId: 2,
                    title: "Chair",
                    description: "Comfortable chair",
                    price: 150,
                    imagesURL: ImagesURL(small: nil, thumb: nil),
                    creationDate: "2023-04-02T12:30:20+0000",
                    isUrgent: true),
            ADModel(id: 3,
                    categoryId: 1,
                    title: "Phone",
                    description: "Latest smartphone",
                    price: 800, imagesURL:
                        ImagesURL(small: nil, thumb: nil),
                    creationDate: "2023-04-03T17:10:50+0000",
                    isUrgent: false)
        ]
    }

    override func tearDown() {
        adCategoryAssociationService = nil
        ads = nil
        categories = nil
        super.tearDown()
    }

    func testAssociate_AssociateCategoriesToAds() {
        let adsWithCategories = adCategoryAssociationService.associateCategoriesToAds(ads: ads, categories: categories)
        
        XCTAssertEqual(adsWithCategories[0].category?.name, "Electronics", "The first ad should be associated with 'Electronics'")
        XCTAssertEqual(adsWithCategories[1].category?.name, "Furniture", "The second ad should be associated with 'Furniture'")
        XCTAssertEqual(adsWithCategories[2].category?.name, "Electronics", "The third ad should be associated with 'Electronics'")

        XCTAssertNotNil(adsWithCategories[0].category, "The first ad should have a category")
        XCTAssertNotNil(adsWithCategories[1].category, "The second ad should have a category")
        XCTAssertNotNil(adsWithCategories[2].category, "The third ad should have a category")
    }

    func testAssociate_AdWithoutCategory() {
        let adWithoutCategory = ADModel(id: 4,
                                        categoryId: 3,
                                        title: "Desk",
                                        description: "A wooden desk",
                                        price: 200,
                                        imagesURL: ImagesURL(small: nil, thumb: nil),
                                        creationDate: "2023-04-04",
                                        isUrgent: false)
        
        let adsWithCategories = adCategoryAssociationService.associateCategoriesToAds(ads: [adWithoutCategory], categories: categories)
        
        XCTAssertNil(adsWithCategories[0].category, "The ad without a corresponding category should have no category associated.")
    }

    func testAssociate_NoAds() {
        let adsWithCategories = adCategoryAssociationService.associateCategoriesToAds(ads: [], categories: categories)
        
        XCTAssertTrue(adsWithCategories.isEmpty, "The result should be an empty list when no ads are provided.")
    }
    
    func testAssociate_NoCategories() {
        let adsWithCategories = adCategoryAssociationService.associateCategoriesToAds(ads: ads, categories: [])
        
        for ad in adsWithCategories {
            XCTAssertNil(ad.category, "No ads should have a category when no categories are provided.")
        }
    }
}
