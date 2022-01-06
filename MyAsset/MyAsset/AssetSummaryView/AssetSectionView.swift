//
//  AssetSectionView.swift
//  MyAsset
//
//  Created by SUN on 2022/01/05.
//

import SwiftUI

struct AssetSectionView: View {
    // @ObservedObject 는 관찰 하는 의미이고 Asset은 Observable이므로 관찰을 받을 수 있다.
    // 연결을 시켜줘서 관찰 역할을 연결해줌
    @ObservedObject var assetSection: Asset
    var body: some View {
        VStack(spacing: 20) {
            AssetSectionHeaderView(title: assetSection.type.title)
            ForEach(assetSection.data) { asset in
                HStack {
                    Text(asset.title)
                        .font(.title)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text(asset.amount)
                        .font(.title2)
                        .foregroundColor(.primary)
                }
                Divider()
            }
            
        }
        .padding()
    }
}

struct AssetSectionView_Previews: PreviewProvider {
    static var previews: some View {
        let asset = Asset(
            id: 0,
            type: .bankAccount,
            data: [
                AssetData(id: 0, title: "kb", amount: "5,333,333,333원"),
                AssetData(id: 1, title: "kdd", amount: "5,111,333,333원"),
                AssetData(id: 2, title: "sdsd", amount: "3,222,333,333원"),
                AssetData(id: 3, title: "ffds", amount: "4,333,333,333원"),])
        AssetSectionView(assetSection: asset)
    }
}
