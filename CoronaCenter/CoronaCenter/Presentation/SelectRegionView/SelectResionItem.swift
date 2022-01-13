//
//  SelectResionItem.swift
//  CoronaCenter
//
//  Created by 장희선 on 2022/01/13.
//

import SwiftUI

struct SelectResionItem: View {
    
    var region: Center.Sido
    var count: Int
    var body: some View {
        ZStack {
            Color(white: 0.9)
            
            VStack {
                Text(region.rawValue)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.purple)
                Text("(\(count))")
                    .font(.callout)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
            }
            .padding()
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct SelectResionItem_Previews: PreviewProvider {
    static var previews: some View {
        let region0 = Center.Sido.경기도
        SelectResionItem(region: region0, count: 3)
    }
}
