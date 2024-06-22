//
//  TitleSection.swift
//  ToDoList
//
//  Created by Mayank Negi on 22/06/24.
//

import SwiftUI

struct TitleSection: View {

    @Binding var title: String

    var body: some View {
        Section {
            TextField("Title", text: $title, prompt: Text("Enter List Title"))
        } header: {
            Text("List Title")
        }
    }
}

#Preview {
    TitleSection(title: .constant("List Title"))
}
