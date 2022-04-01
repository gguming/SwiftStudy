//
//  WebService.swift
//  SwiftUIinUikit
//
//  Created by 장희선 on 2022/04/01.
//

import Foundation

class WebService {
    func loadMovies(url: String, completion: @escaping ([Movie]?) -> ()) {
        
        guard let url = URL(string: url) else {
            fatalError("URL is incorrect")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let moviesResponse = try? JSONDecoder().decode(MovieResponse.self, from: data)
            if let moviesResponse = moviesResponse {
                DispatchQueue.main.async {
                    completion(moviesResponse.search)
                }
            }
        }.resume()
    }
}
