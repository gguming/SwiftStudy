//
//  OpservableObjectApp.swift
//  OpservableObject
//
//  Created by 장희선 on 2022/01/25.
//

import SwiftUI

@main
struct OpservableObjectApp: App {
    let userSetting = UserSettings()
    var body: some Scene {
        WindowGroup {
//            ContentView()
            UserSettingsView().environmentObject(userSetting)
        }
    }
}
