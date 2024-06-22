//
//  AddItemViewModel.swift
//  ToDoList
//
//  Created by Mayank Negi on 22/06/24.
//

import Foundation
import Observation
import SwiftUI

@Observable
final class AddItemViewModel {

    var title: String = ""
    var selectedColor: Color = .clear

    let screenTitle = "Add List"
    let navBarDoneButton = "Done"
    let navBarCancelButton = "Cancel"

}
