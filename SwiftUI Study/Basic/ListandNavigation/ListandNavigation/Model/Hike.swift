//
//  Hike.swift
//  ListandNavigation
//
//  Created by 장희선 on 2022/01/19.
//

import Foundation


struct Hike {
    let name: String
    let imageURL: String
    let miles: Double
}

extension Hike {
    static func all() -> [Hike] {
        return [
            Hike(name: "배봉산", imageURL: "cuba", miles: 6),
            Hike(name: "북한산", imageURL: "cuba", miles: 5.8),
            Hike(name: "인왕산", imageURL: "cuba", miles: 5)
        ]
    }
}
