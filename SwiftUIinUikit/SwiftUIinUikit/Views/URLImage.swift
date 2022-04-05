//
//  URLImage.swift
//  SwiftUIinUikit
//
//  Created by 장희선 on 2022/04/04.
//

import Foundation
import SwiftUI


struct URLImage: View {
    
    @ObservedObject private var imageLoader = ImageLoader()
    var placeholder: Image
    
    init(url: String, placeholder: Image = Image(systemName: "photo")) {
        self.placeholder = placeholder
        self.imageLoader.load(url: url)
    }
    var body: some View {
        if let uiImage = self.imageLoader.downloadImage {
            Image(uiImage: uiImage)
        } else {
            placeholder
        }
    }
    
}
