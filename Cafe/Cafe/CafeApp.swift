//
//  CafeApp.swift
//  Cafe
//
//  Created by 장희선 on 2022/01/14.
//

import SwiftUI

@main
struct CafeApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .accentColor(.green)
        }
    }
}

// tintColor
// accentColor -> swiftUI
