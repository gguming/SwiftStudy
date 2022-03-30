//
//  ContentView.swift
//  ForeachTest
//
//  Created by 장희선 on 2022/03/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ForEach(1..<4) { number in
                Text("Hello, world!")
                if number != 3 {
                    Divider()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
