//
//  Article.swift
//  NewsMVVM
//
//  Created by SUN on 2022/03/01.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String
}
