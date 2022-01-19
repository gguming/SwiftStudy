//
//  ListBackgroundColor.swift
//  List
//
//  Created by 장희선 on 2022/01/19.
//

import SwiftUI

struct ListBackgroundColor: View {
    let friend = [
        Friend(name: "하이11"),
        Friend(name: "하이22"),
        Friend(name: "하이33"),
        Friend(name: "하이44")
                  ]
    
    init() {
//        UITableView.appearance().backgroundColor = UIColor.yellow
//        UITableViewCell.appearance().backgroundColor = UIColor.green
    }
    var body: some View {
//        List(friend.indices, id: \.self) { index in
//            let friend = friend[index]
//            HStack {
//                Text("\(friend.name)")
//                Spacer()
//            }
//            .listRowBackground(Color.red)
////            .background(Color(UIColor.green))
//        }
        
        /*
        List {
            ForEach(1...10, id: \.self ) { index in
                HStack{
                    Text("\(index)")
                }
                .listRowBackground(Color.green)
            }
        }
        .listRowBackground(Color.yellow)
         */
        
        
        ScrollView {
            LazyVStack {
                ForEach(1...10, id: \.self ) { index in
                    HStack{
                        VStack(alignment: .leading) {
                            Text("\(index)")
                            Divider()
                        }
                        Spacer()
                    }
                    
                }
            }
            .padding()
            .background(.green)
        }
        .background(Color.red)
    }
}

struct ListBackgroundColor_Previews: PreviewProvider {
    static var previews: some View {
        ListBackgroundColor()
    }
}
