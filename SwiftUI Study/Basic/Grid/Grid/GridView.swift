//
//  GridView.swift
//  Grid
//
//  Created by 장희선 on 2022/01/20.
//

// List로 짠 Grid

import SwiftUI

struct GridView: View {
    var body: some View {
        List {
            ForEach(0..<5) { _ in
                HStack {
                    ForEach(0..<2) { _ in
                        Image("ny")
                            .resizable()
                            .scaledToFit()
                    }
                }
            }
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
