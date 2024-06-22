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

    @Binding var listItems: [Item]

    var body: some View {
        NavigationStack {
            Form {
                
                Section {
                    TextField("Title", text: $title, prompt: Text("Enter List Title"))
                } header: {
                    Text("List Title")
                }
                
                Section {
                    VStack {
                        ColorPicker("Colour", selection: $color)
                        HStack {
                            ForEach([Color.red, Color.green, Color.blue, Color.orange, Color.yellow], id: \.self) { color in

                                Circle()
                                    .fill(color)
                                    .frame(width: 44, height: 44)
                                    .padding([.top, .bottom])
                                    .onTapGesture {
                                        self.color = color
                                    }

                            }

                            Spacer()
                        }
                    }
                } header: {
                    Text("Pick Color")
                }
            }
            .navigationTitle("Add List")
            .toolbar {
                ToolbarItem(id: "Done", placement: .confirmationAction) {
                    Button("Done", role: .none) {
                        listItems.append(Item(title: title, task: nil, color: self.color))
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
