//
//  DropDownTestApp.swift
//  DropDownTest
//
//  Created by 장희선 on 2022/06/02.
//

import SwiftUI

@main
struct DropDownTestApp: App {
    static var uniqueKey: String {
            UUID().uuidString
        }
 

    var body: some Scene {
        WindowGroup {
            ContentView(placeholder: "테스트", options: [
                DropDownOption(key: DropDownTestApp.uniqueKey, value: "Sunday"),
                DropDownOption(key: DropDownTestApp.uniqueKey, value: "Monday"),
                DropDownOption(key: DropDownTestApp.uniqueKey, value: "Tuesday"),
                DropDownOption(key: DropDownTestApp.uniqueKey, value: "Wednesday"),
                DropDownOption(key: DropDownTestApp.uniqueKey, value: "Thursday"),
                DropDownOption(key: DropDownTestApp.uniqueKey, value: "Friday"),
                DropDownOption(key: DropDownTestApp.uniqueKey, value: "Saturday")
            ]
)
        }
    }
}
