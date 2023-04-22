//
//  DenemeRequest.swift
//  PlayGroundApp
//
//  Created by Ramazan Öğünç on 22.04.2023.
//

import Foundation

class DenemeRequest : RequestProtocol {
    var url: String = "https://jsonplaceholder.typicode.com/"
    var path: String = "posts/1"
    var requestType: RequestType = .Get
    typealias ResponseType = Post
}
