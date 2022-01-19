//
//  ViewController.swift
//  AppCardTest
//
//  Created by 장희선 on 2022/01/19.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let _url = "kakaotalk:"

        if let openApp = URL(string: _url), UIApplication.shared.canOpenURL(openApp) {
            // 버전별 처리
            if #available(iOS 10.0, *) {
                    UIApplication.shared.open(openApp, options: [:], completionHandler: nil)
                }
                else {
                    UIApplication.shared.openURL(openApp)
                    }
                }
              
                //스키마명을 사용해 외부앱 실행이 불가능한 경우
                else {
                    print("[goDeviceApp : 디바이스 외부 앱 열기 실패]")
                    print("링크 주소 : \(_url)")
                }
        

    }
    
    

}

