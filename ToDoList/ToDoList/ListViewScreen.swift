//
//  ListViewScreen.swift
//  ToDoList
//
//  Created by Mayank Negi on 18/06/24.
//

import SwiftUI

struct Item: Identifiable {
    let id = UUID()
    let title: String
    let task: Int?
}

var listItems = [
    Item(title: "Garden", task: 2),
    Item(title: "1 Nov", task: 3),
    Item(title: "Password", task: 1),
    Item(title: "Tomorrow", task: nil),
]

struct ListViewScreen: View {

    @State var appItems = listItems
    @State var isShowingAddItemScreen = false

    var body: some View {
        NavigationStack {
            List(appItems) { item in
                HStack {
                    Text(item.title)

                    Spacer()

                    if let task = item.task {
                        Text("\(task)")
                            .foregroundStyle(.gray)
                    }
                }
                .fontWeight(.semibold)
                .font(.title3)
                .padding()
            }
            .listStyle(.plain)
            .navigationTitle("List")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Item", systemImage: "plus", action: {
                        isShowingAddItemScreen = true
                    })
                    .sheet(isPresented: $isShowingAddItemScreen, onDismiss: {
                        print("Screen dismissed")
                    }, content: {
                        AddItemScreen()
                    })
                }
            }
        }
    }
}

#Preview {
    ListViewScreen()
}
