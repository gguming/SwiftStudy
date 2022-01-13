//
//  CenterApi.swift
//  CoronaCenter
//
//  Created by 장희선 on 2022/01/13.
//

import Foundation


struct CenterApi {
    static let scheme = "https"
    static let host = "api.odcloud.kr"
    static let path = "/api/15077586/v1/centers"
    
    func getCenterListComponents() -> URLComponents {
        var components = URLComponents()
        
        components.scheme = CenterApi.scheme
        components.host = CenterApi.host
        components.path = CenterApi.path
        
        components.queryItems = [
            URLQueryItem(name: "perPage", value: "300")
        ]
        
        return components
    }
}
