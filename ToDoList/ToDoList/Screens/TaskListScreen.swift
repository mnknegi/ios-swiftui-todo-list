//
//  TaskListScreen.swift
//  ToDoList
//
//  Created by Mayank Negi on 19/06/24.
//

import SwiftUI

struct TaskListScreen: View {

    @State var viewModel = TaskListViewModel()

    var screenTitle: String

    var body: some View {

        ZStack {
            List {
                ToDoTasksSection(tasks: $viewModel.tasks)

                CompletedTasksSection(tasks: $viewModel.tasks)
            }

            FloatingAddButton(isShowingAddTaskScreen: $viewModel.isShowingAddTaskScreen)
        }
        .navigationTitle(screenTitle)
        .sheet(isPresented: $viewModel.isShowingAddTaskScreen, content: {
            AddTaskScreen(tasks: $viewModel.tasks)
        })
    }
}

#Preview {
    NavigationStack {
        TaskListScreen(screenTitle: "Item Title")
    }
}
