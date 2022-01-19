//
//  RefreshList.swift
//  List
//
//  Created by 장희선 on 2022/01/19.
//

import SwiftUI


struct RefreshList: View {
    
    @State private var refreshDates: [Date] = []
    
    var body: some View {
        NavigationView {
            List(refreshDates, id: \.self) { date in
                Text("\(date)")
            }
            .listStyle(.plain)
            .refreshable {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    let currentDate = Date()
                    refreshDates.append(currentDate)
                }
            }
            .navigationTitle("Pull to Refresh")
        }
        
    }
    
}


struct RefreshList_Previews: PreviewProvider {
    static var previews: some View {
        RefreshList()
    }
}
