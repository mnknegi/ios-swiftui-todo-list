//
//  TaskRowView.swift
//  ToDoList
//
//  Created by Mayank Negi on 22/06/24.
//

import SwiftUI

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

#Preview {
    TaskRowView(task: .constant(Task(title: "Task")))
}
