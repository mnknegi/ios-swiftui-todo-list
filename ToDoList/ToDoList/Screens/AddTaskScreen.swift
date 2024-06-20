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

    @State var activityTitle: String = ""
    @State var date: Date = Date()

    var body: some View {
        NavigationStack {
            Form {
                TextField("Activity Name", text: $activityTitle, prompt: Text("New Activity"))
                DatePicker("Pick a Date", selection: $date, in: Date.now..., displayedComponents: [.date, .hourAndMinute])
                Menu("Set due date") {
                    Button("Today \((Date.now.formatted(.dateTime.weekday(.wide))))") {
                        date = Date.now
                    }
                    
                    Button("Tomorrow \((Date.now.addingTimeInterval(86400).formatted(.dateTime.weekday(.wide))))") {
                        date = Date.now.addingTimeInterval(86400)
                    }
                    
                    Button("Next week on this day") {
                        date = Date.now.addingTimeInterval(604800)
                    }
                }
            }
            .navigationTitle("Add Activity")
            .toolbar {
                ToolbarItem(id: "Add", placement: .confirmationAction) {
                    Button("Add", role: .none) {
                        tasks.append(Task(title: activityTitle, completionDate: date))
                        dismiss()
                    }
                }
                
                ToolbarItem(id: "Cancel", placement: .topBarLeading) {
                    Button("Cancel", role: .cancel) {
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
