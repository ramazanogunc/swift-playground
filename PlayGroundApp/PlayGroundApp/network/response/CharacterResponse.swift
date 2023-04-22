//
//  CharacterResponse.swift
//  PlayGroundApp
//
//  Created by Ramazan Öğünç on 22.04.2023.
//

import Foundation

struct CharacterResponse: Codable {
    let info: PagingInfo
    let results: [Character]
}
