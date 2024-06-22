//
//  AddTaskViewModel.swift
//  ToDoList
//
//  Created by Mayank Negi on 22/06/24.
//

import Foundation
import Observation

@Observable
final class AddTaskViewModel {

    var activityTitle: String = ""
    var date: Date = Date()

    let screenTitle = "Add Activity"
    let navBarAddButton = "Add"
    let navBarCancelButton = "Cancel"
}
