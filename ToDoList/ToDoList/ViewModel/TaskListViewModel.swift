//
//  TaskListViewModel.swift
//  ToDoList
//
//  Created by Mayank Negi on 22/06/24.
//

import Foundation
import Observation

@Observable
final class TaskListViewModel {

    var tasks = mockTasks
    var isShowingAddTaskScreen = false
    var isEditingEnabled = false
    var editedTaskTitle = ""
    
}
