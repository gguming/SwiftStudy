//
//  ViewController.swift
//  NotificationCenterTest
//
//  Created by SUN on 2022/06/19.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func moveNextVC(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func makeNextVCBlue(_ sender: Any) {
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
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(changeBackground(_:)),
                                               name: .changeBackgroundColor,
                                               object: nil)
    }


}

extension Notification.Name {
    static let changeBackgroundColor = Notification.Name("changeBackgroundColor")
}

