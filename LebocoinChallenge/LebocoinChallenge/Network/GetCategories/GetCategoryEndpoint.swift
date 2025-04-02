//
//  GetCategoryEndpoint.swift
//  LebocoinChallenge
//
//  Created by Carlos Gonçalves on 02/04/2025.
//

import Foundation

struct GetCategoryEndpoint: Endpoint {
    var body: Data?
    
    var headers: [String : String]?
    
    var method: HTTPMethod { .get }
    
    var path: String { "categories.json" }
    
    var queryParameters: [String : String]?
    
    
}
