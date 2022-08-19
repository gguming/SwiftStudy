//
//  Type.swift
//  translate
//
//  Created by SUN on 2022/08/16.
//

import Foundation
import UIKit

enum `Type` {
    case source
    case target
    
    var color: UIColor {
        switch self {
        case .source:
            return .label
        case .target:
            return .systemPink
        }
    }
}
