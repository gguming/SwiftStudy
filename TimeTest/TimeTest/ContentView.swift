//
//  ContentView.swift
//  TimeTest
//
//  Created by 장희선 on 2022/01/17.
//

import SwiftUI
import Foundation

struct ContentView: View {

    var body: some View {
        VStack {
            Text("\(timeFormatter(timestamp:(1642395819000))!)")
                .padding()
            Button(
                action: {
                    print(Date().timeIntervalSince1970)},
                label: {
                    Text("시간")
                })
            
        }
        
        
    }
    
    func timeFormatter(timestamp: TimeInterval) -> String? {
        let timeStamp = timestamp/1000
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "ko_KR")
        
        dateFormatter.dateFormat = "yyyy.MM.dd HH:mm"
        
        let date = Date(timeIntervalSince1970: timeStamp)
        
        return dateFormatter.string(from: date)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
