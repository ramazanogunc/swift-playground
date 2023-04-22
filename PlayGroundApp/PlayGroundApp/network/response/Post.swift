//
//  Post.swift
//  PlayGroundApp
//
//  Created by Ramazan Öğünç on 22.04.2023.
//

import Foundation

struct Post : Decodable {
    let userId: Int?
    let id: Int
    let title: String
    let body: String
    
    enum CodingKeys: String, CodingKey {
        case userId
        case id
        case title
        case body
      }
    
}
