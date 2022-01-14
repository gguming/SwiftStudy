//
//  OtherView.swift
//  Cafe
//
//  Created by 장희선 on 2022/01/14.
//

import SwiftUI

struct OtherView: View {
    // 배경 흰색으로 만들어줌
    init() {
        UITableView.appearance().backgroundColor = .systemBackground
    }
    var body: some View {
        NavigationView {
            List {
                ForEach(Menu.allCases) { section in
                    Section(
                        content: {
                            ForEach(section.menu, id: \.hashValue) { raw in
                                NavigationLink(raw,
                                               destination: {
                                    Text("\(raw)")
                                })
                            }
                        },
                        header: {
                            Text(section.title)
                        }
                    )
                }
            }
                .listStyle(GroupedListStyle())
                .navigationTitle("Other")
                .toolbar {
                    NavigationLink(
                        destination: {
                            SettingView()
                        },
                        label: {
                            Image(systemName: "gear")
                        }
                    )
                }
            
        }
        
    }
}

struct OtherView_Previews: PreviewProvider {
    static var previews: some View {
        OtherView()
    }
}
