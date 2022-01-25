//
//  FancyTimer.swift
//  OpservableObject
//
//  Created by 장희선 on 2022/01/25.
//

import Foundation
import SwiftUI
import Combine


class FancyTimer: ObservableObject {
    
    @Published var value: Int = 0
    init() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.value += 1
        }
    }
}
