//
//  StorageManager.swift
//  PlayGroundApp
//
//  Created by Ramazan Öğünç on 27.04.2023.
//

import Foundation
import CoreData

class StorageManager {
    
    static let shared = StorageManager()
    
    // MARK: - Core Data stack
    
    private let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TodoCoreData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    private let viewContext: NSManagedObjectContext
    
    private init() {
        viewContext = persistentContainer.viewContext
    }
    
    // MARK: - Task methods
    func fetchData(completion: (Result<[Todo], Error>)-> Void) {
        let fetchRequest = Todo.fetchRequest()
        
        do {
            let tasks = try self.viewContext.fetch(fetchRequest)
            completion(.success(tasks))
        } catch let error {
            completion(.failure(error))
        }
    }
    
    func create(_ taskName: String, completion: (Todo)-> Void) {
        let todo = Todo(context: viewContext)
        todo.name = taskName
        todo.isCompleted = false
        completion(todo)
        saveContext()
    }
    
    func update(_ todo: Todo, newName: String) {
        todo.name = newName
        saveContext()
    }
    
    func delete(_ todo: Todo) {
        viewContext.delete(todo)
        saveContext()
    }
    
    func saveContext() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                let error = error as NSError
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
}

