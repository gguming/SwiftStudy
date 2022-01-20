//
//  HikeDetail.swift
//  ListandNavigation
//
//  Created by 장희선 on 2022/01/19.
//

import SwiftUI

struct HikeDetail: View {
    
    let hike: Hike
    @State private var zoomed: Bool = false
    var body: some View {
        VStack {
            Image(hike.imageURL)
                .resizable()
//                .aspectRatio(contentMode: .fit)
                .aspectRatio(contentMode: self.zoomed ? .fill : .fit)
                .onTapGesture {
                    withAnimation {
                        self.zoomed.toggle()
                    }
                   
                }
            
            Text(hike.name)
            Text(String(format: "%.2f", hike.miles))
        }
//        .navigationTitle(hike.name)
        .navigationTitle(Text(hike.name))
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct HikeDetail_Previews: PreviewProvider {
    static var previews: some View {
        HikeDetail(hike: Hike(name: "하하", imageURL: "cuba", miles: 10.3))
    }
}
