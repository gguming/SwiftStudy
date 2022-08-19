//
//  Bookmark.swift
//  translate
//
//  Created by SUN on 2022/08/16.
//

import Foundation


struct Bookmark: Codable {
    let sourceLanguage: Language
    let translateLanguage: Language
    
    let sourceText: String
    let translatedText: String

}

