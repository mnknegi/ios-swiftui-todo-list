//
//  ListViewScreen.swift
//  ToDoList
//
//  Created by Mayank Negi on 18/06/24.
//

import SwiftUI

struct ListViewScreen: View {

    @State var viewModel = ListViewModel()

    var body: some View {
        NavigationStack {
            List(viewModel.listItems) { item in
                NavigationLink {
                    TaskListScreen(screenTitle: item.title)
                } label: {
                    ItemListRow(item: item)
                }
            }
            .listStyle(.plain)
            .navigationTitle(viewModel.screenTitle)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(viewModel.navBarAddButton, systemImage: viewModel.naveBarAddButtonImage, action: {
                        viewModel.isShowingAddItemScreen = true
                    })
                    .sheet(isPresented: $viewModel.isShowingAddItemScreen, content: {
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
