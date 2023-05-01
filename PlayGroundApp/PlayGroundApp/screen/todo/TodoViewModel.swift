//
//  TodoViewModel.swift
//  PlayGroundApp
//
//  Created by Ramazan Öğünç on 26.04.2023.
//

import Foundation

class TodoViewModel : BaseViewModel {
    
    
    var todos: [Todo]  = []
    var comletedTodos: [Todo]  = []
    
    
    var updateCollectionView : (()->Void)? = nil
    var selectedIndex : Int = 0 {
        didSet {
            updateCollectionView?()
        }
    }
    
    func activeList() -> [Todo] {
        if selectedIndex == 0 {
            return todos
        }
        return comletedTodos
    }
    
    
    func fetchData() {
        StorageManager.shared.fetchData { result in
            switch result {
            case .success(let todos):
                for todo in todos {
                    if todo.isCompleted {
                        self.comletedTodos.append(todo)
                    } else {
                        self.todos.append(todo)
                    }
                }
                updateCollectionView?()
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
    
    func updateTodo(todo: Todo, isCompleted: Bool) {
        todo.isCompleted = isCompleted
        if isCompleted {
            self.todos.removeAll { $0.id == todo.id }
            self.comletedTodos.append(todo)
        }
        else {
            self.comletedTodos.removeAll { $0.id == todo.id }
            self.todos.append(todo)
        }
        print("todos")
        
        StorageManager.shared.update(todo)
        updateCollectionView?()
    }
    
    func delete(todo: Todo) {
        todos.removeAll { $0.id == todo.id }
        comletedTodos.removeAll { $0.id == todo.id }
        StorageManager.shared.delete(todo)
        updateCollectionView?()
    }
}
