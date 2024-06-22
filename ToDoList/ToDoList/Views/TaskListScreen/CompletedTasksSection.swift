//
//  CompletedTasksSection.swift
//  ToDoList
//
//  Created by Mayank Negi on 22/06/24.
//

import SwiftUI

struct CompletedTasksSection: View {

    @Binding var tasks: [Task]

    var body: some View {
        Section {
            ForEach($tasks) { task in
                if task.isCompleted.wrappedValue {
                    TaskRowView(task: task)
                }
            }
        } header: {
            if showCompletedHeader() {
                Text("Completed")
            }
        }
    }

    func showCompletedHeader() -> Bool {
        !tasks.filter({ $0.isCompleted }).isEmpty
    }
}

#Preview {
    CompletedTasksSection(tasks: .constant([Task(title: "Completed Task", isCompleted: true)]))
}
