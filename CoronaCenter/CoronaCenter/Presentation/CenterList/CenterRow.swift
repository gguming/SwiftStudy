//
//  CenterRow.swift
//  CoronaCenter
//
//  Created by 장희선 on 2022/01/13.
//

import SwiftUI

struct CenterRow: View {
    var center: Center
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text(center.facilityName)
                    .font(.headline)
                Text(center.centerType.rawValue)
                    .font(.caption)
                    .foregroundColor(.gray)
                Spacer()
            }
            Text(center.address)
                .font(.footnote)
            
            if let url = URL(string: "tel" + center.phoneNumber) {
                Link(center.phoneNumber, destination: url)
            }
        }
        .padding()
    }
}

struct CenterRow_Previews: PreviewProvider {
    static var previews: some View {
        let center0 = Center(id: 0, sido: .경기도, facilityName: "실낵ㄲㄱ", address: "경기도 경기시 경기구", lat: "37.40337", lng: "126.9491998", centerType: .central, phoneNumber: "010-0110-0101")
        CenterRow(center: center0)
    }
}
