//
//  MyWebView.swift
//  SheetTest
//
//  Created by 장희선 on 2022/03/03.
//

import SwiftUI
import WebKit

struct MyWebView: UIViewRepresentable {
    var urlToLoad: String = "http://192.168.0.177:10020/myinfo/merchants?platform=ios&token=eyJ0b2tlblR5cGUiOiJCZWFyZXIiLCJhbGciOiJIUzI1NiJ9.eyJtZW1iZXJJZHgiOiJLU1UwMDAzIiwiZXhwIjoxNjc3ODI5NjkxLCJpYXQiOjE2NDYyOTM2OTF9._XAFkfPtoDzPVXiyBOr7TacmP2nrNEQFCQpMWHpL2UU&memberIdx=KSU0003"
    @Environment(\.dismiss) var dismiss
    //ui view 만들기
    func makeUIView(context: Context) -> WKWebView {
        
        //unwrapping
        guard let url = URL(string: self.urlToLoad) else {
            return WKWebView()
        }
        //웹뷰 인스턴스 생성
        let webView = WKWebView()
        
        //웹뷰를 로드한다
        webView.load(URLRequest(url: url))
        return webView
    }
    
    //업데이트 ui view
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<MyWebView>) {
        
    }
}

struct MyWebView_Previews: PreviewProvider {
    static var previews: some View {
        MyWebView()
    }
}
