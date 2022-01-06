//
//  ContentView.swift
//  Shared
//
//  Created by 장희선 on 2022/01/06.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var timerData: TimerData = TimerData()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Timer count = \(timerData.timeCount)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                Button {
                    resetCount()
                } label: {
                    Text("Reset Counter")
                }
                
                NavigationLink {
                    SecondView(timerData: timerData)
                } label: {
                    Text("NextScreen")
                }
                .padding()


            }
        }
    }
    
    func resetCount() {
        timerData.resetCount()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
