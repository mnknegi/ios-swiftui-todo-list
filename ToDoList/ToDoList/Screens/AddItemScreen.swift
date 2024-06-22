//
//  AddItemScreen.swift
//  ToDoList
//
//  Created by Mayank Negi on 18/06/24.
//

import SwiftUI

struct AddItemScreen: View {

    @Environment(\.dismiss) var dismiss

    @State var title: String = ""
    @State var selectedColor: Color = .clear

    @Binding var listItems: [Item]

    var body: some View {
        NavigationStack {
            Form {
                
                TitleSection(title: $title)
                ColorSection(selectedColor: $selectedColor)

            }
            .navigationTitle("Add List")
            .toolbar {
                ToolbarItem(id: "Done", placement: .confirmationAction) {
                    Button("Done", role: .none) {
                        listItems.append(Item(title: title, count: nil, color: self.selectedColor))
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
