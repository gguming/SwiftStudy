//
//  ImageLoader.swift
//  SwiftUIinUikit
//
//  Created by 장희선 on 2022/04/04.
//

import Foundation
import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    var downloadImage: UIImage?
    let didChange = PassthroughSubject<ImageLoader?, Never>()
    
    func load(url: String) {
        guard let imageURL = URL(string: url) else { fatalError("ImageURL is not correct") }

        URLSession.shared.dataTask(with: imageURL) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    self.didChange.send(nil)
                }
                return
            }
            self.downloadImage = UIImage(data: data)
            DispatchQueue.main.async {
                self.didChange.send(self)
            }
        }.resume()
    }
}
