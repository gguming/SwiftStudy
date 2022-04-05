//
//  ContentView.swift
//  Graphics1
//
//  Created by 장희선 on 2022/04/05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            
//        VStack {
//            Circle()
//                .fill(Color.red)
//                .frame(width: 200, height: 200)
//            Circle()
//                .stroke(Color.green, lineWidth: 20)
//
//            Rectangle()
//                .fill(Color.yellow)
//                .frame(width: 100, height: 200)
//        }
        BarGragh(reports: Report.all())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
