//
//  WebViewModel.swift
//  WebViewTest
//
//  Created by 장희선 on 2022/02/28.
//

import Foundation
import Combine
import CoreData

typealias WebNavigation = WebViewModel.Navigation

class WebViewModel: ObservableObject {
    enum Navigation {
        case Back, Forward, Refresh
    }
    
    enum URL_TYPE {
        case NAVER
        case GOOGLE
        case TESTURL
        
        var url: URL? {
            switch self {
            case .NAVER: return URL(string: "https://naver.com")
            case .GOOGLE: return URL(string: "https://google.com")
            case .TESTURL: return URL(string: "https://tuentuenna.github.io/simple_js_alert/")
                
            }
        }
    }
    // 웹뷰의 url이 변경되었을 떄 이벤트를 전달
    var changedUrlSubject = PassthroughSubject<WebViewModel.URL_TYPE, Never>()
    
    // 웹뷰 네비게이션 액션에 대한 이벤트
    var webNavigationSubject = PassthroughSubject<WebNavigation, Never>()
    
    // 웹사이트 타이틀 이벤트
    var webTitleSubject = PassthroughSubject<String, Never>()
    
    // iOS -> JS 함수 호출
    var nativeToJsEvent = PassthroughSubject<String, Never>()
    
    // 자바 스크립트 alert가 들어오면 이벤트 보내기
    var jsAlertEvent = PassthroughSubject<JsAlert, Never>()
}
