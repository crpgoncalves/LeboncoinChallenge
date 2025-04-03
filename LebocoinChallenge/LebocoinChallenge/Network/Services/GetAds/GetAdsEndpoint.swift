//
//  GetAdsEndpoint.swift
//  LeboncoinChallenge
//
//  Created by Carlos Gonçalves on 03/04/2025.
//

import Foundation

struct GetAdsEndpoint: Endpoint {
    var body: Data?
    
    var headers: [String : String]?
    
    var method: HTTPMethod { .get }
    
    var path: String { "listing.json" }
    
    var queryParameters: [String : String]?
}

