//
//  Task.swift
//  TodoList
//
//  Created by SUN on 2022/08/23.
//

import Foundation


struct Task {
    let title: String
    let priority: Priority
}

enum Priority: Int {
    case high
    case medium
    case low
}
