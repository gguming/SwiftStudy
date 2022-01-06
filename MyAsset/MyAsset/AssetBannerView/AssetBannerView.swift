//
//  AssetBannerView.swift
//  MyAsset
//
//  Created by SUN on 2022/01/05.
//

import SwiftUI

struct AssetBannerView: View {
    let bannerList: [AssetBanner] = [
        AssetBanner(title: "공지사항", description: "확인 요망", backgroundColor: .red),
        AssetBanner(title: "공지사항22", description: "확인 요망", backgroundColor: .gray),
        AssetBanner(title: "공지사항33", description: "확인 요망", backgroundColor: .blue),
        AssetBanner(title: "공지사항44", description: "확인 요망", backgroundColor: .yellow)]
    
    @State private var currentPage = 0
    var body: some View {
        let bannerCards = bannerList.map { BannerCard(banner: $0) }
        
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: bannerCards,
                               currentPage: $currentPage)
            PageControl(numberOfPages: bannerList.count,
                        currentPage: $currentPage)
                .frame(width: CGFloat(bannerCards.count * 18))
                .padding(.trailing)
        }
            
    }
}

struct AssetBannerView_Previews: PreviewProvider {
    static var previews: some View {
        AssetBannerView()
            .aspectRatio(5/2, contentMode: .fit)
    }
}
