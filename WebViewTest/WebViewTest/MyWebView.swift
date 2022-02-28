//
//  MyWebView.swift
//  WebViewTest
//
//  Created by 장희선 on 2022/02/28.
//

import SwiftUI
import WebKit
import Combine

// uikit의 uiview를 사용
struct MyWebView: UIViewRepresentable {
    @EnvironmentObject var viewModel: WebViewModel
    
    var urlToLoad: String
    
    // 코디네이터 만들기
    func makeCoordinator() -> MyWebView.Coordinator {
        return MyWebView.Coordinator(self)
    }
    
    // uiView 만들기
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: self.urlToLoad) else {
            return WKWebView()
        }
        let webview = WKWebView(frame: .zero, configuration: createWKWebConfig())
        
        // wkwebview 의 delegate 연결을 위한 coordinator 설정
        webview.uiDelegate = context.coordinator as? WKUIDelegate
        webview.navigationDelegate = context.coordinator as? WKNavigationDelegate
        webview.allowsBackForwardNavigationGestures = true
        // 웹뷰 로드
        webview.load(URLRequest(url: url))
        
        return webview
    }
    
    // update ui view
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<MyWebView>) {
        
    }
    
    func createWKWebConfig() -> WKWebViewConfiguration {
        // 웹뷰 설정
        let preferences = WKPreferences()
        preferences.javaScriptCanOpenWindowsAutomatically = true
        preferences.javaScriptEnabled = true
        
        let wkWebConfig = WKWebViewConfiguration()
        
        // 웹뷰 유저 컨트롤러
        let userContentController = WKUserContentController()
        userContentController.add(self.makeCoordinator(), name: "callbackHandler")
        wkWebConfig.userContentController = userContentController
        wkWebConfig.preferences = preferences
        
        return wkWebConfig
    }
    
    class Coordinator: NSObject {
        var myWebView: MyWebView // SwiftUI View
        
        var subscriptions = Set<AnyCancellable>()
        
        init(_ myWebView: MyWebView) {
            self.myWebView = myWebView
        }
    }
}

// MARK: - UIDelegate 관련
extension MyWebView.Coordinator: WKUIDelegate {
    
}

// MARK: - WKNavigationDelegate 링크 이동 관련
extension MyWebView.Coordinator: WKNavigationDelegate {
    
    // 웹뷰 검색 시작
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("webview didStartProvisionalNavigation")
        myWebView
            .viewModel
            .webNavigationSubject
            .sink{ (action: WebNavigation) in
                print("들어온 네비게이션 액션: \(action)")
                switch action {
                case .Back:
                    if webView.canGoBack {
                        webView.goBack()
                    }
                case .Forward:
                    if webView.canGoForward {
                        webView.goForward()
                    }
                case .Refresh:
                    webView.reload()
                }
            }.store(in: &subscriptions)
    }
    
    // 웹뷰 검색 완료
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        webView.evaluateJavaScript("document.title") { (response, error) in
            if let error = error {
                print("에러 발생")
            }
            if let title = response as? String {
                self.myWebView.viewModel.webTitleSubject.send(title)
            }
        }
        
        myWebView
            .viewModel
            .nativeToJsEvent
            .sink { message in
                print("didFinish() called / nativeToJsEvent 이벤트 들어옴 / message: \(message)")
                webView.evaluateJavaScript("nativeToJsEventCall('\(message)')",
                                           completionHandler: { (result, error) in
                    if let result = result {
                        print("nativeToJs result 성공 : \(result)")
                    }
                    if let error = error {
                        print("nativeToJs result 실패 : \(error.localizedDescription)")
                    }
                    
                })
            }.store(in: &subscriptions)
        myWebView
            .viewModel
            .changedUrlSubject
            .compactMap { $0.url }
            .sink { changedUrl in
                print("변경된 url: \(changedUrl)")
                webView.load(URLRequest(url: changedUrl))
            }.store(in: &subscriptions)
    }
}

// MARK: - WKNavigationDelegate 링크 이동 관련
extension MyWebView.Coordinator: WKScriptMessageHandler {
    // 웹뷰 js에서 호출하는 메소드가 들어옴
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print("WKWebViewCoordinator - userContentController / message: \(message)")
        
        if message.name == "callbackHandler" {
            print("JSON 데이터와 웹으로부터 옴: \(message.body)")
            if let receiveData: [String: String] = message.body as? Dictionary {
                print("receiveData: \(receiveData)")
                myWebView.viewModel.jsAlertEvent.send(JsAlert(receiveData["message"], .JS_BRIDGE))
            }
        }
    }
    
    
}

struct MyWebView_Previews: PreviewProvider {
    static var previews: some View {
        MyWebView(urlToLoad: "https://www.naver.com")
    }
}
