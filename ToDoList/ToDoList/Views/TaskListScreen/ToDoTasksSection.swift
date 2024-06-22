//
//  ToDoTasksSection.swift
//  ToDoList
//
//  Created by Mayank Negi on 22/06/24.
//

import SwiftUI

struct ToDoTasksSection: View {

    @Binding var tasks: [Task]
    @Binding var isEditingEnabled: Bool
    @Binding var editedTaskTitle: String

    var body: some View {
        Section {
            ForEach($tasks) { task in
                if !task.isCompleted.wrappedValue {
                    TaskRowView(task: task)
                        .swipeActions(edge: .leading, allowsFullSwipe: false) {
                            Button {
                                isEditingEnabled = true
                            } label: {
                                Label("Edit Title", systemImage: "pencil")
                            }
                            .alert("Edit Task", isPresented: $isEditingEnabled) {
                                TextField("Edit Task title", text: $editedTaskTitle)

                                Button("OK", action: {
                                    // Update the task inside DB
                                    // get all the tasks from DB
                                })

                                Button("Cancel", role: .cancel, action: {})
                            }
                            .tint(.indigo)
                        }
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
    ToDoTasksSection(tasks: .constant([Task(title: "ToDo Task")]), isEditingEnabled: .constant(true), editedTaskTitle: .constant("Edited Task Title"))
}
