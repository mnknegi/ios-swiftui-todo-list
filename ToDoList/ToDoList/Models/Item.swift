//
//  Item.swift
//  ToDoList
//
//  Created by Mayank Negi on 19/06/24.
//

import Foundation
import SwiftUI

struct Item: Identifiable {
    let id = UUID()
    let title: String
    let count: Int?
    var color: Color = .clear
}
