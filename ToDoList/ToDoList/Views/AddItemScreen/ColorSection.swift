//
//  ColorSection.swift
//  ToDoList
//
//  Created by Mayank Negi on 22/06/24.
//

import SwiftUI

struct ColorSection: View {

    @Binding var selectedColor: Color

    var body: some View {
        Section {
            VStack {
                ColorPicker("Colour", selection: $selectedColor)
                HStack {
                    ForEach([Color.red, Color.green, Color.blue, Color.orange, Color.yellow], id: \.self) { color in

                        Circle()
                            .fill(color)
                            .frame(width: 44, height: 44)
                            .padding([.top, .bottom])
                            .onTapGesture {
                                self.selectedColor = color
                            }
                    }

                    Spacer()
                }
            }
        } header: {
            Text("Pick Color")
        }
    }
}

#Preview {
    ColorSection(selectedColor: .constant(.clear))
}
