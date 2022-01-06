//
//  AssetSummaryView.swift
//  MyAsset
//
//  Created by SUN on 2022/01/05.
//

import SwiftUI

struct AssetSummaryView: View {
    // 외부에서 데이터를 받아서 내부의 환경을 바꾼다는 의미
    @EnvironmentObject var assetData: AssetSummaryData
    
    var assets: [Asset]{
        return assetData.assets
    }
    var body: some View {
        VStack(spacing: 20) {
            
            ForEach(assets) { asset in
                switch asset.type {
                case .creditCard:
                    AssetCardSectionView(asset: asset)
                        .frame(idealHeight: 250)
                default:
                    AssetSectionView(assetSection: asset)
                }
                
            }
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding()
        }
    }
}

struct AssetSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        AssetSummaryView()
            .environmentObject(AssetSummaryData())
            .background(Color.gray.opacity(0.2))
    }
}
