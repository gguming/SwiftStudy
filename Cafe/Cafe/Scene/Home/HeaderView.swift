//
//  HeaderView.swift
//  Cafe
//
//  Created by 장희선 on 2022/01/14.
//

import SwiftUI

struct HeaderView: View {
    
    @Binding var isNeedToReload: Bool
    var body: some View {
        VStack(spacing: 16.0) {
            HStack(alignment: .top) {
                Text("""
                \(User.shared.userName)님~
                반갑습니다!☕️
                """)
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fixedSize(horizontal: false, vertical: true)
                Button {
                    isNeedToReload = true
                } label: {
                    Image(systemName: "arrow.triangle.2.circlepath")
                }
            }
            HStack {
                Button(
                    action: {
                        print("new")
                    },
                    label: {
                        Image(systemName: "mail")
                            .foregroundColor(.gray)
                        Text("What's New")
                            .foregroundColor(.primary)
                            .font(.system(size: 16.0, weight: .semibold, design: .default))
                    }
                )
                Button(
                    action: {
                        print("new")
                    },
                    label: {
                        Image(systemName: "ticket")
                            .foregroundColor(.gray)
                        Text("Coupon")
                            .foregroundColor(.primary)
                            .font(.system(size: 16.0, weight: .semibold, design: .default))
                    }
                )
                Spacer()
                Button(
                    action: {
                        print("new")
                    },
                    label: {
                        Image(systemName: "bell")
                            .foregroundColor(.gray)
                    }
                )
            }
        }
        .padding(16.0)
    }
}

