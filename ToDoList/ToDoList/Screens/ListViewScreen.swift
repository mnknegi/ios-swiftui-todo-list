//
//  ListViewScreen.swift
//  ToDoList
//
//  Created by Mayank Negi on 18/06/24.
//

import SwiftUI

struct ListViewScreen: View {

    @StateObject var viewModel = ListViewModel()

    var body: some View {
        NavigationStack {
            List(viewModel.listItems) { item in
                NavigationLink {
                    TaskListScreen()
                } label: {
                    ItemListRow(item: item)
                }
            }
            .listStyle(.plain)
            .navigationTitle("List")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Item", systemImage: "plus", action: {
                        viewModel.isShowingAddItemScreen = true
                    })
                    .sheet(isPresented: $viewModel.isShowingAddItemScreen, onDismiss: {
                        print("Screen dismissed")
                    }, content: {
                        AddItemScreen(listItems: $viewModel.listItems)
                    })
                }
            }
        }
    }
}

#Preview {
    ListViewScreen()
}
