//
//  WebViewTestApp.swift
//  WebViewTest
//
//  Created by 장희선 on 2022/02/28.
//

import SwiftUI

@main
struct WebViewTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(WebViewModel())
        }
    }
}
