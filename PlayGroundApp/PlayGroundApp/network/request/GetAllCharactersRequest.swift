//
//  DenemeRequest.swift
//  PlayGroundApp
//
//  Created by Ramazan Öğünç on 22.04.2023.
//

import Foundation

class GetAllCharactersRequest : RequestProtocol {
    
    var path: String = "character"
    var requestType: RequestType = .Get
    typealias ResponseType = CharacterResponse
    
    var parameters: [String: Any] = [:]
        
    init(page: Int) {
        parameters["page"] = page
    }
    
}
