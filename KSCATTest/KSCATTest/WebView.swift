//
//  WebView.swift
//  KSCATTest
//
//  Created by 장희선 on 2022/05/16.
//

import SwiftUI
import WebKit
import Combine

struct WebView: UIViewRepresentable {
    
    @ObservedObject var viewModel: ViewModel
    
    var requestURL: String = ""
    
    class Coordinator: NSObject {
        var myWebView: WebView
        
        var subscription = Set<AnyCancellable>()
        
        init(_ webView: WebView) {
            self.myWebView = webView
        }
    }
    
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: requestURL) else { return WKWebView() }
        
        let preferences = WKPreferences()
        preferences.javaScriptCanOpenWindowsAutomatically = true
        
        
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        
        let webview = WKWebView(frame: .null, configuration: configuration)
        webview.navigationDelegate = context.coordinator
        webview.uiDelegate = context.coordinator
        webview.load(URLRequest(url: url))
        return webview
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
    
}

extension WebView.Coordinator: WKUIDelegate {
    
}

extension WebView.Coordinator: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
       
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        guard let url = navigationAction.request.url,
                  url.scheme != "http" && url.scheme != "https"
        else {
            decisionHandler(.allow)
            return
        }
        UIApplication.shared.open(url)
        decisionHandler(.cancel)

    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myWebView.viewModel
            .changeURLSubject
            .compactMap { $0 }
            .sink { url in
                print(url)
                webView.load(URLRequest(url: URL(string: url)!))
            }.store(in: &subscription)
            
    }
}


