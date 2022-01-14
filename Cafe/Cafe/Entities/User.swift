//
//  User.swift
//  Cafe
//
//  Created by 장희선 on 2022/01/14.
//

import Foundation

struct User {
    let userName: String
    let account: String
    
    static let shared = User(userName: "오이", account: "gmail")
}
