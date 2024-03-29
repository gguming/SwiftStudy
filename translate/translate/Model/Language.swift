//
//  Language.swift
//  translate
//
//  Created by SUN on 2022/08/15.
//

import Foundation

enum Language: String, CaseIterable, Codable {
    case ko, en, ja, ch = "zh-CN"
    
    var title: String {
        switch self {
        case .ko:
            return NSLocalizedString("Korean", comment: "한국어")
        case .en:
            return NSLocalizedString("English", comment: "영어")
        case .ja:
            return NSLocalizedString("Japanese", comment: "일본어")
        case .ch:
            return NSLocalizedString("Chinese", comment: "중국어")
        }
    }
    
    var languageCode: String {
        self.rawValue
    }
}
