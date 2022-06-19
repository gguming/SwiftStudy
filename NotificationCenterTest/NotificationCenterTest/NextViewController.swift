//
//  NextViewController.swift
//  NotificationCenterTest
//
//  Created by SUN on 2022/06/19.
//

import Foundation
import UIKit


class NextViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @objc func changeBackground(_ notification: Notification) {
        if let color = notification.object as? UIColor {
            self.view.backgroundColor = color
        }
    }
}
