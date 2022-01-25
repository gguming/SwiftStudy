//
//  FancyScoreView.swift
//  OpservableObject
//
//  Created by 장희선 on 2022/01/25.
//

import SwiftUI

struct FancyScoreView: View {
    
//    @Binding var score: Int
    @EnvironmentObject var userSettings: UserSettings
    var body: some View {
        VStack {
            Text("\(userSettings.score)")
            Button("Increment Score") {
                self.userSettings.score += 1
            }
            .background(Color.green)
        }
        .padding()
        .background(Color.orange)
    }
}

struct FancyScoreView_Previews: PreviewProvider {
    static var previews: some View {
//        FancyScoreView(score: .constant(0))
        FancyScoreView()
    }
}
