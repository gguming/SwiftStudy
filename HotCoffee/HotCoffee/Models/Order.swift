//
//  Order.swift
//  HotCoffee
//
//  Created by SUN on 2022/03/12.
//

import Foundation

enum CoffeeType: String, Codable, CaseIterable {
    case cappuccino
    case latte
    case espressino
    case cortado
}

enum CoffeeSize: String, Codable, CaseIterable {
    case small
    case medium
    case large
}

struct Order: Codable {
    let name: String
    let email: String
    let type: CoffeeType
    let size: CoffeeSize
}


extension Order {
    init?(_ vm: AddCoffeeViewModel) {
        guard let name = vm.name,
               let email = vm.email,
             let type = CoffeeType(rawValue:vm.selectedType!.lowercased()),
              let size = CoffeeSize(rawValue:vm.selectedSize!.lowercased()) else {
                  return nil
              }
        
        self.name = name
        self.email = email
        self.type = type
        self.size = size
    }
}
