//
//  TodoViewModel.swift
//  PlayGroundApp
//
//  Created by Ramazan Öğünç on 26.04.2023.
//

import Foundation

class TodoViewModel : BaseViewModel {
    
    
    var todos: [Todo]  = []
    
    
    var updateCollectionView : (()->Void)? = nil
    
    
    func fetchData() {
        StorageManager.shared.fetchData { result in
            switch result {
            case .success(let todos):
                self.todos = todos
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func save(name: String) {
        StorageManager.shared.create(name) { todo in
            self.todos.append(todo)
            updateCollectionView?()
        }
    }
    
    func delete() {
        
    }
}
