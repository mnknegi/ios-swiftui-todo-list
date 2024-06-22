//
//  ToDoTasksSection.swift
//  ToDoList
//
//  Created by Mayank Negi on 22/06/24.
//

import SwiftUI

struct ToDoTasksSection: View {

    @Binding var tasks: [Task]

    var body: some View {
        Section {
            ForEach($tasks) { task in
                if !task.isCompleted.wrappedValue {
                    TaskRowView(task: task)
                }

            }
            .onDelete(perform: deleteTask)
        }
    }

    func deleteTask(at index: IndexSet) {
        tasks.remove(atOffsets: index)
    }
}

#Preview {
    ToDoTasksSection(tasks: .constant([Task(title: "ToDo Task")]))
}
