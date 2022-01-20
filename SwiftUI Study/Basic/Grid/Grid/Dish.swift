//
//  Dish.swift
//  Grid
//
//  Created by 장희선 on 2022/01/20.
//

import Foundation
import SwiftUI

struct Dish {
    let id = UUID()
    let name: String
    let price: Double
    let imageURL: String
}

extension Dish {
    static func all() -> [Dish] {
        return [
        Dish(name: "김치", price: 35, imageURL: "ny"),
        Dish(name: "라면", price: 33, imageURL: "ny"),
        Dish(name: "치즈", price: 1, imageURL: "ny"),
        Dish(name: "짜파게티", price: 42, imageURL: "ny"),
        Dish(name: "스파게티", price: 45, imageURL: "ny"),
        Dish(name: "스테이크", price: 50, imageURL: "ny")]
    }
}
