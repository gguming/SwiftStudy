//
//  HomeView.swift
//  Cafe
//
//  Created by 장희선 on 2022/01/14.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                HeaderView(isNeedToReload: $viewModel.isNeedToReload)
                MenuSuggestionSectionView(coffeeMenu: $viewModel.coffeeMenu)
                Spacer(minLength: 32.0)
                EventSectionView(events: $viewModel.events)
                
            }
           
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
