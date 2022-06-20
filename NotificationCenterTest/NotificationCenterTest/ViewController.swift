//
//  NextViewController.swift
//  NotificationCenterTest
//
//  Created by SUN on 2022/06/19.
//

import Foundation
import UIKit

// 처음 화면
class ViewController: UIViewController {
    
    @IBAction func moveToNextVC(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 옵저버 등록
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(changeBackground(_:)),
                                               name: .changeBackgroundColor,
                                               object: nil)
        
    }
    // 옵저버로 신호가 올 경우 수행할 메소드(바탕화면 바꾸기 기능)
    @objc func changeBackground(_ notification: Notification) {
        if let color = notification.object as? UIColor {
            self.view.backgroundColor = color
        }
    }
}



