//
//  RequestProtocol.swift
//  PlayGroundApp
//
//  Created by Ramazan Öğünç on 22.04.2023.
//

import Foundation

protocol RequestProtocol {
    var url: String { get }
    var path : String { get }
    var requestType: RequestType { get }
    associatedtype ResponseType: Decodable
    var parameters: [String: Any] { get }
    var headers: [String: String] { get }
    
}

extension RequestProtocol {
    var url: String {
        return "https://rickandmortyapi.com/api/"
    }
    
    var fullUrl: String {
        return "\(url)\(path)"
    }
    
    var parameters: [String: Any] {
        return [:]
    }
    
    var headers: [String: String] {
       return [:]
    }
}

