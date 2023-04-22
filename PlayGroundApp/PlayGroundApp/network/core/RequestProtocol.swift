//
//  RequestProtocol.swift
//  PlayGroundApp
//
//  Created by Ramazan Öğünç on 22.04.2023.
//

import Foundation

protocol RequestProtocol {
    
    var path : String { get }
    
    var requestType: RequestType { get }
    
    associatedtype ResponseType: Decodable
    
}

extension RequestProtocol {
    var url: String {
        return "https://jsonplaceholder.typicode.com/" + path
    }
    
    var parameters: [String: Any] {
        return [:]
    }
    
    var headers: [String: String] {
       return [:]
   }
}

