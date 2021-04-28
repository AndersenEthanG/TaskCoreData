//
//  TaskController.swift
//  TaskCoreData
//
//  Created by Ethan Andersen on 4/27/21.
//

import CoreData

class TaskController {
    
    // MARK: - Properties
    static let sharedInstance = TaskController()
    
    var tasks: [Task] = []
    
    // The Fetch Request
    private lazy var fetchRequest: NSFetchRequest<Task> = {
        let request = NSFetchRequest<Task>(entityName: "Task")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    
    // MARK: - Functions
    
    func createTask(name: String, note: String?, dueDate: Date?) {
        // Put in the property names (The same as the Model) and give them values, which are equal to the passed in ones
        Task(name: name, note: note, dueDate: dueDate)
        // Run that saveContext function
        CoreDataStack.saveContext()
    }
    
    func fetchTask() {
        // Run tasks through the Fetch request
        tasks = (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
    }
    
    func updateTask(task: Task, name: String, note: String?, dueDate: Date?) {
        // Reassign the variables to the passed in ones
        task.name = name
        task.note = note
        task.dueDate = dueDate
        CoreDataStack.saveContext()
    }
    
    func toggleIsComplete(task: Task) {
        // Bool toggle
        task.isComplete.toggle()
        CoreDataStack.saveContext()
    }
    
    func deleteTask(task: Task) {
        guard let index = tasks.firstIndex(of: task) else { return }
        tasks.remove(at: index)
        CoreDataStack.context.delete(task)
        CoreDataStack.saveContext()
    }
    
} // End of Class
