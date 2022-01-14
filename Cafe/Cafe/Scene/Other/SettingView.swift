//
//  SettingView.swift
//  Cafe
//
//  Created by 장희선 on 2022/01/14.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        List {
            Section {
                SettingUserInfoSectionView()
            }
            Button("회원 정보 수정") {}
            .tint(.black)
            Button("회원 탈퇴") {}
            .tint(.black)
        }
        .navigationTitle("설정")
        .listStyle(GroupedListStyle())
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SettingUserInfoSectionView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4.0) {
                Text(User.shared.userName)
                    .font(.title)
                Text(User.shared.account)
                    .font(.caption)
            }
            Spacer()
            Button(
                action: {},
                label: {
                    Text("로그아웃")
                        .tint(.green)
                        .font(.system(size: 14.0, weight: .bold, design: .default))
                }
                
            )
                .padding(8.0)
                .overlay(Capsule().stroke(Color.green))
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
