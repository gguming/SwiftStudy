//
//  ContentView.swift
//  ListandNavigation
//
//  Created by 장희선 on 2022/01/19.
//

import SwiftUI

struct ContentView: View {
    let hikes = Hike.all()
    var body: some View {
        NavigationView{
            List(hikes, id: \.name) { hike in
                NavigationLink(
                    destination: {
                        HikeDetail(hike: hike)
                    },
                    label: {
                        HikeCell(hike: hike)
                    })
                
            }
            .navigationTitle("Hiking")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HikeCell: View {
    let hike: Hike
    var body: some View {
        HStack {
            Image(hike.imageURL)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(16)
            VStack (alignment: .leading) {
                Text(hike.name)
                Text(String(format: "%.2f", hike.miles))
            }
        }
    }
}
