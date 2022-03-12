//
//  AddCoffeeViewModel.swift
//  HotCoffee
//
//  Created by SUN on 2022/03/12.
//

import Foundation

struct AddCoffeeViewModel {
    var name: String?
    var email: String?
    var selectedType: String?
    var selectedSize: String?
    
    var types: [String] {
        return CoffeeType.allCases.map{ $0.rawValue.capitalized }
    }
    
    var sizes: [String] {
        return CoffeeSize.allCases.map{ $0.rawValue.capitalized }
    }
}
