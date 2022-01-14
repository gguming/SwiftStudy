//
//  MenuSuggestionSectionView.swift
//  Cafe
//
//  Created by 장희선 on 2022/01/14.
//

import SwiftUI

struct MenuSuggestionSectionView: View {
    @Binding var coffeeMenu: [CoffeeMenu]
    var body: some View {
        VStack {
            Text("\(User.shared.userName)님을 위한 추천메뉴")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 16.0)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(coffeeMenu) { menu in
                        MenuSeggestionItemView(coffeMenu: menu)
                    }
                }
                .padding(.horizontal, 16.0)
            }
            .onAppear {
                UIScrollView.appearance().isPagingEnabled = true
            }
        }    
    }
}

struct MenuSeggestionItemView: View {
    let coffeMenu: CoffeeMenu
    var body: some View {
        VStack {
            coffeMenu.image
                .resizable()
                .clipShape(Circle())
                .frame(width: 100.0, height: 100.0)
            Text(coffeMenu.name)
                .font(.caption)
        }
        
    }
}
