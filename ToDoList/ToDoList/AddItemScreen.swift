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
    @State var color: Color = .clear

    var body: some View {
        NavigationStack {
            Form {
                
                Section {
                    TextField("Title", text: $title, prompt: Text("Enter List Title"))
                } header: {
                    Text("List Title")
                }
                
                Section {
                    ColorPicker("Colour", selection: $color)
                } header: {
                    Text("Pick Color")
                }
            }
            .navigationTitle("Add List")
            .toolbar {
                ToolbarItem(id: "Done", placement: .topBarTrailing) {
                    Button("Done", role: .none) {
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
        AddItemScreen(title: "Garden", color: .clear)
    }
}
