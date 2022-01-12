//
//  SearchBlogApi.swift
//  SearchDaumBlog
//
//  Created by 장희선 on 2022/01/12.
//

import Foundation


struct SearchBlogApi {
    static let scheme = "https"
    static let host = "dapi.kakao.com"
    static let path = "/v2/search/"
    
    func searchBlog(query: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = SearchBlogApi.scheme
        components.host = SearchBlogApi.host
        components.path = SearchBlogApi.path + "blog"
        
        // 검색할 때 반영되는 쿼리를 표시
        components.queryItems = [
            URLQueryItem(name: "query", value: query)
        ]
        return components
    }
}
