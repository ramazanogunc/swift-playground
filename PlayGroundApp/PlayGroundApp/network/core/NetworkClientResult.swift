//
//  NetworkClientResult.swift
//  PlayGroundApp
//
//  Created by Ramazan Öğünç on 22.04.2023.
//

import Foundation

enum NetworkClientResult<T> {
    case success(T)
    case error(Error)
}
