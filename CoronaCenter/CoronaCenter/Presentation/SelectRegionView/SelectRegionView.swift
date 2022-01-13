//
//  SelectRegionView.swift
//  CoronaCenter
//
//  Created by 장희선 on 2022/01/13.
//

import SwiftUI

struct SelectRegionView: View {
    // bind(viewModel: ViewModel)과 같은 표현
    @ObservedObject var viewModel = SelectRegionViewModel()
    
    private var items: [GridItem] {
        Array(repeating: .init(.flexible(minimum: 80)), count: 2)
    }
    var body: some View {
        NavigationView{
            ScrollView{
                // caseIterable을 사용하여 모든 케이스를 불러온다.
                LazyVGrid(columns: items,  spacing: 20) {
                    ForEach(Center.Sido.allCases, id: \.id) {
                        sido in
                        let centers = viewModel.centers[sido] ?? []
                        NavigationLink(
                            destination: CenterList(centers: centers)) {
                        SelectResionItem(region: sido, count: centers.count)
                            }
                    }
                }
                .padding()
                .navigationTitle("코로나19 예방접종 센터")
            }
        }
    }
}

struct SelectRegionView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SelectRegionViewModel()
        SelectRegionView(viewModel: viewModel)
    }
}
