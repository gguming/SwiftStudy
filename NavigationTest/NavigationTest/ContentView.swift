//
//  ContentView.swift
//  NavigationTest
//
//  Created by 장희선 on 2022/03/18.
//

import SwiftUI

struct ContentView: View {
    @State var isShow: Bool = false
    var body: some View {
        NavigationLink<<#Label: View#>, <#Destination: View#>>(isActive: $isShow, destination: Color.red, label:  Text("Hello, world!")
            .padding())
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
