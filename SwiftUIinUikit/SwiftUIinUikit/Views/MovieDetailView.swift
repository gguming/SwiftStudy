//
//  MovieDetailView.swift
//  SwiftUIinUikit
//
//  Created by 장희선 on 2022/04/04.
//

import Foundation
import SwiftUI

struct MovieDetailView: View {
    @State private var selected: Bool = false
    
    let movie: Movie
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                StartViewRepresentation(selected: $selected)
                    .frame(width: 35, height: 35)
                    .padding()
            }
            URLImage(url: movie.poster)
//            Image(movie.poster)
            Text(movie.title)
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let movie = Movie(title: "Batman", imdbId: "dd", poster: "Dd")
        MovieDetailView(movie: movie)
    }
}
