//
//  Character.swift
//  PlayGroundApp
//
//  Created by Ramazan Öğünç on 22.04.2023.
//

import Foundation

struct Character: Codable {
    let id: Int
    let name: String
    let type: String
    let gender: Gender
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

