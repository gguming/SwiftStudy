//
//  UserSettingsView.swift
//  OpservableObject
//
//  Created by 장희선 on 2022/01/25.
//

import SwiftUI

struct UserSettingsView: View {
//    @ObservedObject var userSettings = UserSettings()
    @EnvironmentObject var userSettings: UserSettings
    var body: some View {
        VStack {
        Text("\(userSettings.score)")
            .font(.largeTitle)
            Button("Increment Score") {
                self.userSettings.score += 1
            }
            
            FancyScoreView()
        }
    }
}

struct UserSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        UserSettingsView()
    }
}
