//
//  MockData.swift
//  ToDoList
//
//  Created by Mayank Negi on 19/06/24.
//

import Foundation

let mockItems = [
    Item(title: "Garden", count: 2),
    Item(title: "Grosseries", count: 4),
    Item(title: "Fruits", count: nil),
    Item(title: "Dishes", count: 0),
]

let mockTasks = [
    Task(title: "Task 1", isFavourite: false, isCompleted: false, completionDate: Date.now),
    Task(title: "Task 2", isFavourite: false, isCompleted: false, completionDate: Date.now.addingTimeInterval(86400)),
    Task(title: "Task 3", isFavourite: true, isCompleted: false, completionDate: Date.now),
    Task(title: "Task 4", isFavourite: true, isCompleted: true, completionDate: Date.now.addingTimeInterval(86400)),
    Task(title: "This is a very long long title of a task", isFavourite: false, isCompleted: true, completionDate: Date.now),
]
