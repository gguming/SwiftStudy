//
//  ContentView.swift
//  StateNBinding
//
//  Created by 장희선 on 2022/01/20.
//

// @state를 사용하지 않으면 프로그램 실행중에 값을 변경할 수 없음

import SwiftUI

struct ContentView: View {
//    var name: String = "neoguri"
    @State private var name: String = "neoguri"
    var body: some View {
        VStack{
            Text(name)
                .font(.largeTitle)
            Button(
                action: {
                    self.name = "merry"
                },
                label: {
                    Text("Change Name")
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
