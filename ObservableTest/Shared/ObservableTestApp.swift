//
//  ObservableTestApp.swift
//  Shared
//
//  Created by 장희선 on 2022/01/06.
//

import SwiftUI

@main
struct ObservableTestApp: App {
    
    let timeData = TimerData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(timeData)
        }
    }
        
}
