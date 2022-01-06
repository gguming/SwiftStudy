//
//  SecondView.swift
//  ObservableTest
//
//  Created by 장희선 on 2022/01/06.
//

import SwiftUI

struct SecondView: View {
    
    @ObservedObject var timerData: TimerData
    var body: some View {
        VStack {
            Text("Second View")
                .font(.largeTitle)
            Text("Timer Count = \(timerData.timeCount)")
                .font(.headline)
        }
        .padding()
        
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView(timerData: TimerData())
    }
}
