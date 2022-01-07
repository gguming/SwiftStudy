//
//  ToDoItem.swift
//  ObservableTest (iOS)
//
//  Created by 장희선 on 2022/01/07.
//

import Foundation

struct ToDoItem: Identifiable {
    var id = UUID()
    var task: String
    var imageName: String
}
