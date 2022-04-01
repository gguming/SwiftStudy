//
//  Movie.swift
//  SwiftUIinUikit
//
//  Created by 장희선 on 2022/04/01.
//

import Foundation


struct MovieResponse: Codable {
    let search: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case search = "Search"
    }
}

struct Movie: Codable {
    let title: String
    let imdbId: String
    let poster: String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case imdbId = "imdbID"
        case poster = "Poster"
    }
}
