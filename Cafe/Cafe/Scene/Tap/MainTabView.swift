//
//  MainTabView.swift
//  Cafe
//
//  Created by 장희선 on 2022/01/14.
//

import SwiftUI


struct MainTabView: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                    Tab.home.imageItem
                    Tab.home.tabTextItem
                }
            OtherView()
                .tabItem {
                    Tab.other.imageItem
                    Tab.other.tabTextItem
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}

// HStack

//struct SampleListView: View {
//
//    struct Number: Identifiable {
//        let value: Int
//        var id: Int { value }
//    }
//
//    let numbers: [Number] = (0...100).map { Number(value: $0) }
//
    //    map, compactMap, filter, reduce 면접 단골 질문
    //    var body: some View {
    //        // 최대 10개까지 가능
    //        ScrollView(.horizontal){
    //            // 한번에 그려도 퍼포먼스에 문제가 없을 때 사용
    //            LazyHStack {
    //                // ForEach의 속성은 배열의 값을 받아야 하며 배열의 속성은 Identifiable을 따른다
    //                // Identifiable은 id값에 따라 각각의 셀을 구분하기 때문에 반영이 필요해서 struct를 추가하여 반영
    //                ForEach(numbers) { number in
    //                    Text("\(number.value)")
    //                }
    //            }
    //        }
    //    }
    
//    var body: some View {
//        List {
//            Section(header: Text("Header")) {
//                ForEach(numbers) { number in
//                    Text("\(number.value)")
//                }
//            }
//            Section(header: Text("Header2"), footer: Text("Footer")) {
//                ForEach(numbers) { number in
//                    Text("\(number.value)")
//                }
//            }
//        }
//
//    }
//}
//
//struct SampleListView_Preview: PreviewProvider {
//    static var previews: some View {
//        SampleListView()
//    }
//}
// LazyHStack


// List
