//
//  WebService.swift
//  CombineForNoti
//
//  Created by 장희선 on 2022/04/06.
//

import Foundation
import Combine

class WebService {
    
    func getPosts() -> AnyPublisher<[Post], Error> {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            fatalError("Invalid URL")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Post].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main) // 중요함
            .eraseToAnyPublisher()
    }

}
