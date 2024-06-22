//
//  AddItemScreen.swift
//  ToDoList
//
//  Created by Mayank Negi on 18/06/24.
//

import SwiftUI

struct AddItemScreen: View {

    @Environment(\.dismiss) var dismiss

    @Binding var listItems: [Item]

    @State var viewModel = AddItemViewModel()

    var body: some View {
        NavigationStack {
            Form {
                
                TitleSection(title: $viewModel.title)
                ColorSection(selectedColor: $viewModel.selectedColor)

            }
            .navigationTitle(viewModel.screenTitle)
            .toolbar {
                ToolbarItem(id: viewModel.navBarDoneButton, placement: .confirmationAction) {
                    Button(viewModel.navBarDoneButton, role: .none) {
                        listItems.append(Item(title: viewModel.title, count: nil, color: viewModel.selectedColor))
                        dismiss()
                    }
                    .disabled(viewModel.title.isEmpty)
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
        AddItemScreen(listItems: .constant(mockItems))
    }
}
