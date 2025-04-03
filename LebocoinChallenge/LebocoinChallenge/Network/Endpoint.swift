//
//  Endpoint.swift
//  LeboncoinChallenge
//
//  Created by Carlos Gonçalves on 02/04/2025.
//

import Foundation

protocol Endpoint {
    var body: Data? { get }
    var headers: [String: String]? { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var queryParameters: [String: String]? { get }
}

