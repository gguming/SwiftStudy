//
//  ViewController.swift
//  NotificationCenterTest
//
//  Created by SUN on 2022/06/19.
//

import UIKit

// 다음 화면
class NextViewController: UIViewController {
    
    @IBAction func makeNextVCBlue(_ sender: Any) {
        // notification 보냄
        NotificationCenter.default.post(name: .changeBackgroundColor,
                                        object: UIColor.blue)
    }
    
    @IBAction func makeNextVCRed(_ sender: Any) {
        NotificationCenter.default.post(name: .changeBackgroundColor,
                                        object: UIColor.red)
    }
    
    @IBAction func makeNextVCGreen(_ sender: Any) {
        NotificationCenter.default.post(name: .changeBackgroundColor,
                                        object: UIColor.green)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


}

extension Notification.Name {
    // notification 이름 등록
    static let changeBackgroundColor = Notification.Name("changeBackgroundColor")
}

