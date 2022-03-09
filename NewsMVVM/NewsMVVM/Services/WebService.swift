//
//  WebService.swift
//  NewsMVVM
//
//  Created by SUN on 2022/03/01.
//

import Foundation

class WebService {
    func getArticles(url: URL, completion: @escaping ([Article]?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                print(11)
                if let articleList = articleList {
                    completion(articleList.articles)
                    print(22)
                }
                print(articleList?.articles)
            }
        }.resume()
    }
}
