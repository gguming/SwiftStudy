//
//  Tab.swift
//  Cafe
//
//  Created by 장희선 on 2022/01/14.
//

import SwiftUI

// 데이터와 뷰 분리
enum Tab {
    case home
    case other
    
    // associate value
    var tabTextItem: Text {
        switch self {
        case .home: return Text("Home")
        case .other: return Text("Other")
        }
    }
    
    var imageItem: Image {
        switch self {
        case .home: return Image(systemName: "house.fill")
        case .other: return Image(systemName: "ellipsis")
        }
    }
}
