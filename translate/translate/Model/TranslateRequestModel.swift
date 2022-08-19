//
//  TranslateRequestModel.swift
//  translate
//
//  Created by SUN on 2022/08/16.
//

import Foundation

struct TranslateRequestModel: Codable {
    let source: String
    let target: String
    let text: String
}
