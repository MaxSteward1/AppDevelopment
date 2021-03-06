//
//  ToDo.swift
//  ToDoList
//
//  Created by Max Steward on 14/12/2017.
//  Copyright © 2017 StewardStudios. All rights reserved.
//

import UIKit

struct ToDo {
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    
    static func loadToDos() -> [ToDo]? {
        return nil
    }
    
    static func loadSampleToDos() -> [ToDo] {
        let todo1 = ToDo(title: "ToDo1", isComplete: false, dueDate: Date(), notes: "Notes 1")
        let todo2 = ToDo(title: "ToDo2", isComplete: false, dueDate: Date(), notes: "Notes 2")
        return [todo1, todo2]
    }
    
    static let dueDateFormatter: DateFormatter = {
       let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    
    
}
