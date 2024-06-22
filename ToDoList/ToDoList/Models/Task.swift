//
//  Task.swift
//  ToDoList
//
//  Created by Mayank Negi on 19/06/24.
//

import Foundation

struct Task: Identifiable {
    let id = UUID()
    var title: String
    var isFavourite = false
    var isCompleted = false
    var completionDate = Date()
}
