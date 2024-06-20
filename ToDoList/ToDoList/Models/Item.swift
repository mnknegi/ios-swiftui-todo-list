//
//  Item.swift
//  ToDoList
//
//  Created by Mayank Negi on 19/06/24.
//

import Foundation

struct Item: Identifiable {
    let id = UUID()
    let title: String
    let task: Int?
}
