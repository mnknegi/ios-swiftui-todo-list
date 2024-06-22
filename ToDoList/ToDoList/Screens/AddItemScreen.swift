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
            .navigationTitle("Add List")
            .toolbar {
                ToolbarItem(id: "Done", placement: .confirmationAction) {
                    Button("Done", role: .none) {
                        listItems.append(Item(title: viewModel.title, count: nil, color: viewModel.selectedColor))
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
        AddItemScreen(listItems: .constant(mockItems))
    }
}
