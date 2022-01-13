//
//  CenterList.swift
//  CoronaCenter
//
//  Created by 장희선 on 2022/01/13.
//

import SwiftUI

struct CenterList: View {
    var centers = [Center]()
    var body: some View {
        List(centers, id: \.id) { center in
            NavigationLink(destination: CenterDetailView(center: center)) {
                CenterRow(center: center)
            }
            .navigationTitle(center.sido.rawValue)
        }
        
    }
}

struct CenterList_Previews: PreviewProvider {
    static var previews: some View {
       
        CenterList()
    }
}
