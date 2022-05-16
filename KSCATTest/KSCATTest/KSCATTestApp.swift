//
//  KSCATTestApp.swift
//  KSCATTest
//
//  Created by 장희선 on 2022/05/16.
//

import SwiftUI

@main
struct KSCATTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL { url in
                    print(url)
                    SharedPaymentDataManager.shared.parseUrl(url)
                }
        }
    }
}
