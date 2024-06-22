//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Mayank Negi on 22/06/24.
//

import Foundation

final class ListViewModel: ObservableObject {

    @Published var listItems: [Item] = mockItems
    @Published var isShowingAddItemScreen = false

}
