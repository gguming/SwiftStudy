//
//  ContentView.swift
//  List
//
//  Created by 장희선 on 2022/01/19.
//

import SwiftUI

struct Friend: Identifiable {
    let id = UUID()
    let name: String
}

struct ContentView: View {
    let friend = [
        Friend(name: "하이11"),
        Friend(name: "하이22"),
        Friend(name: "하이33"),
        Friend(name: "하이44")
                  ]
    
    var body: some View {
        List(friend, id: \.id) { friend in
            Text("\(friend.name)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
