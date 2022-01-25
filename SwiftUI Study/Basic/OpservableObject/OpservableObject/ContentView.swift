//
//  ContentView.swift
//  OpservableObject
//
//  Created by 장희선 on 2022/01/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var fancyTimer = FancyTimer()
    var body: some View {
        Text("\(fancyTimer.value)")
            .font(.largeTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
