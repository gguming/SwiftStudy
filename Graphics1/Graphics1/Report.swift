//
//  Report.swift
//  Graphics1
//
//  Created by 장희선 on 2022/04/05.
//

import Foundation


struct Report: Hashable {
    let year: String
    let revenue: Double
}

extension Report {
    static func all() -> [Report] {
        return [
            Report(year: "2001", revenue: 2500),
            Report(year: "2002", revenue: 4500),
            Report(year: "2003", revenue: 6500)
        ]
    }
}
