//
//  AddTaskScreen.swift
//  ToDoList
//
//  Created by Mayank Negi on 19/06/24.
//

import SwiftUI

struct AddTaskScreen: View {

    @Environment(\.dismiss) var dismiss

    @Binding var tasks: [Task]

    @State var viewModel = AddTaskViewModel()

    var body: some View {
        NavigationStack {
            Form {
                TextField("Activity Name", text: $viewModel.activityTitle, prompt: Text("New Activity"))
                DatePicker("Pick a Date", selection: $viewModel.date, in: Date.now..., displayedComponents: [.date, .hourAndMinute])
                Menu("Set due date") {
                    Button("Today \((Date.now.formatted(.dateTime.weekday(.wide))))") {
                        viewModel.date = Date.now
                    }
                    
                    Button("Tomorrow \((Date.now.addingTimeInterval(86400).formatted(.dateTime.weekday(.wide))))") {
                        viewModel.date = Date.now.addingTimeInterval(86400)
                    }
                    
                    Button("Next week on this day") {
                        viewModel.date = Date.now.addingTimeInterval(604800)
                    }
                }
            }
            .navigationTitle(viewModel.screenTitle)
            .toolbar {
                ToolbarItem(id: viewModel.navBarAddButton, placement: .confirmationAction) {
                    Button(viewModel.navBarAddButton, role: .none) {
                        if !viewModel.activityTitle.isEmpty {
                            tasks.append(Task(title: viewModel.activityTitle, completionDate: viewModel.date))
                        }
                        dismiss()
                    }
                }
                
                ToolbarItem(id: viewModel.navBarCancelButton, placement: .topBarLeading) {
                    Button(viewModel.navBarCancelButton, role: .cancel) {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        AddTaskScreen(tasks: .constant(mockTasks))
    }
}
