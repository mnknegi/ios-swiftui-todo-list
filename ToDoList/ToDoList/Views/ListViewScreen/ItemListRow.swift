//
//  ItemListRow.swift
//  ToDoList
//
//  Created by Mayank Negi on 22/06/24.
//

import SwiftUI

struct ItemListRow: View {

    var item: Item

    var body: some View {
        HStack {
            Text(item.title)

            Spacer()

            if let task = item.count {
                Text("\(task)")
                    .foregroundStyle(.gray)
            }
        }
        .fontWeight(.semibold)
        .font(.title3)
        .padding()
    }
}

#Preview {
    ItemListRow(item: Item(title: "Item", count: 2))
}
