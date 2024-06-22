//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Mayank Negi on 22/06/24.
//

import Foundation
import Observation

@Observable
final class ListViewModel {

    var listItems: [Item] = mockItems
    var isShowingAddItemScreen = false

    let screenTitle = "List"
    let navBarAddButton = "Add Item"
    let naveBarAddButtonImage = "plus"

}
