//
//  PagingInfo.swift
//  PlayGroundApp
//
//  Created by Ramazan Öğünç on 22.04.2023.
//

import Foundation

struct PagingInfo: Codable {
    let count, pages: Int
    let next: String?
    let prev: String?
}

