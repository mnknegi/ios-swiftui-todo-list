//
//  TaskListScreen.swift
//  ToDoList
//
//  Created by Mayank Negi on 19/06/24.
//

import SwiftUI

struct TaskListScreen: View {

    @State var tasks = mockTasks
    @State var isShowingAddTaskScreen = false
    @State var isEditingEnabled = false
    @State var editedTaskTitle = ""

    var body: some View {

        ZStack {
            List {
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

            VStack {
                Spacer()
                HStack {
                    Spacer()

                    Button(action: {
                        isShowingAddTaskScreen = true
                    }, label: {
                        Image(systemName: "plus")
                            .scaleEffect(2)
                    })
                    .frame(width: 80, height: 80)
                    .foregroundStyle(.blue)
                    .background(Color.blue.opacity(0.5))
                    .clipShape(Circle())
                }
                .padding()
            }
        }
        .navigationTitle("Garden")
        .sheet(isPresented: $isShowingAddTaskScreen, onDismiss: {
            print("Screen dismissed")
        }, content: {
            AddTaskScreen(tasks: $tasks)
        })
    }

    func showCompletedHeader() -> Bool {
        !tasks.filter({ $0.isCompleted }).isEmpty
    }

    func deleteTask(at index: IndexSet) {
        tasks.remove(atOffsets: index)
    }
}

#Preview {
    NavigationStack {
        TaskListScreen()
    }
}

struct TaskRowView: View {

    @Binding var task: Task

    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "circle.circle.fill": "circle.circle")
                .symbolEffect(.bounce, value: 3)
                .scaleEffect(2)
                .symbolRenderingMode(.hierarchical)
                .padding([.trailing, .top, .bottom])
                .foregroundStyle(.blue)
                .onTapGesture {
                    task.isCompleted.toggle()
                }

            Text(task.title)
                .font(.title3)
                .fontWeight(.semibold)

            Spacer()

            Image(systemName: task.isFavourite ? "star.fill" : "star")
                .symbolEffect(.bounce, value: 3)
                .scaleEffect(1.5)
                .symbolRenderingMode(.hierarchical)
                .foregroundStyle(.blue)
                .onTapGesture {
                    task.isFavourite.toggle()
                }
        }
    }
}
