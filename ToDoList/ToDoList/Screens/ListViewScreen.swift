//
//  ListViewScreen.swift
//  ToDoList
//
//  Created by Mayank Negi on 18/06/24.
//

import SwiftUI

struct ListViewScreen: View {

    @State var listItems: [Item] = mockItems
    @State var isShowingAddItemScreen = false

    var body: some View {
        NavigationStack {
            List(listItems) { item in
                NavigationLink {
                    TaskListScreen()
                } label: {
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
                        AddItemScreen(listItems: $listItems)
                    })
                }
            }
        }
    }
}

#Preview {
    ListViewScreen()
}