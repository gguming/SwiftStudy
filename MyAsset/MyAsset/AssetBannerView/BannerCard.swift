//
//  BannerCard.swift
//  MyAsset
//
//  Created by SUN on 2022/01/04.
//

import SwiftUI

struct BannerCard: View {
    var banner: AssetBanner
    var body: some View {
        ZStack{
            Color(banner.backgroundColor)
            VStack {
                Text(banner.title)
                    .font(.title)
                Text(banner.description)
                    .font(.subheadline)
            }
        }
//        Color(banner.backgroundColor)
//            .overlay(
//                VStack{
//                    Text(banner.title)
//                        .font(.title)
//                    Text(banner.description)
//                        .font(.subheadline)
//                }
//            )
    }
}

struct BannerCard_Previews: PreviewProvider {
    static var previews: some View {
        let banner0 = AssetBanner(title: "공지사항", description: "공지사항을 확인하세요", backgroundColor: .blue)
        BannerCard(banner: banner0)
    }
}
