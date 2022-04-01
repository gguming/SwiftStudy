//
//  OrderViewModel.swift
//  HotCoffee
//
//  Created by SUN on 2022/03/12.
//

import Foundation

class OrderListViewModel {
    var orderViewModel: [OrderViewModel]
    
    init() {
        self.orderViewModel = [OrderViewModel]()
    }
}

extension OrderListViewModel {
    func orderViewModel(at index: Int) -> OrderViewModel {
        return self.orderViewModel[index]
    }
}

struct OrderViewModel {
    let order: Order
}

extension OrderViewModel {
    var name: String {
        return order.name
    }
    
    var email: String {
        return order.email
    }
    
    var type: String {
        return order.type.rawValue.capitalized
    }
    
    var size: String {
        return order.size.rawValue.capitalized
    }
}
