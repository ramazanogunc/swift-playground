//
//  Todo.swift
//  PlayGroundApp
//
//  Created by Ramazan Öğünç on 26.04.2023.
//

import Foundation

struct Todo {
    let name: String
    let isCompleted: Bool
    
    init(name: String, isCompleted: Bool) {
        self.name = name
        self.isCompleted = isCompleted
    }
}
