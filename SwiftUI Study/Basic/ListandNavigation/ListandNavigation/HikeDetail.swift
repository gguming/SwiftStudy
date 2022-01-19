//
//  HikeDetail.swift
//  ListandNavigation
//
//  Created by 장희선 on 2022/01/19.
//

import SwiftUI

struct HikeDetail: View {
    
    let hike: Hike
    var body: some View {
        VStack {
            Image(hike.imageURL)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(hike.name)
            Text(String(format: "%.2f", hike.miles))
        }
    }
}

struct HikeDetail_Previews: PreviewProvider {
    static var previews: some View {
        HikeDetail(hike: Hike(name: "하하", imageURL: "cuba", miles: 10.3))
    }
}
