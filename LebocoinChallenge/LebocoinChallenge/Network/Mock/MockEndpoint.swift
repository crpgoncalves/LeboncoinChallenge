//
//  MockEndpoint.swift
//  LeboncoinChallenge
//
//  Created by Carlos Gonçalves on 02/04/2025.
//

import Foundation

struct MockEndpoint: Endpoint {
    var body: Data?
    
    var headers: [String : String]?
    
    var method: HTTPMethod { .get }
    
    var path: String { "http://base/path/mock" }
    
    var queryParameters: [String : String]?
    
}
