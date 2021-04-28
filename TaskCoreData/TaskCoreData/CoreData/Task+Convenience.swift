//
//  Task+Convenience.swift
//  TaskCoreData
//
//  Created by Ethan Andersen on 4/27/21.
//

import CoreData

extension Task {
    
    @discardableResult convenience init(name: String, note: String?, dueDate: Date?, isComplete: Bool = false, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.name = name
        self.note = nil
        self.dueDate = nil
        self.isComplete = isComplete
    }
}
