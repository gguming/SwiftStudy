//
//  Event.swift
//  Cafe
//
//  Created by 장희선 on 2022/01/14.
//

import SwiftUI


struct Event: Identifiable {
    let id = UUID()
    let image: Image
    let title : String
    let description: String

}
