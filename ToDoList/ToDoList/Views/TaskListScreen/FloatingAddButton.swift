//
//  FloatingAddButton.swift
//  ToDoList
//
//  Created by Mayank Negi on 22/06/24.
//

import SwiftUI

struct FloatingAddButton: View {

    @Binding var isShowingAddTaskScreen: Bool

    var body: some View {
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
}

#Preview {
    FloatingAddButton(isShowingAddTaskScreen: .constant(false))
}
