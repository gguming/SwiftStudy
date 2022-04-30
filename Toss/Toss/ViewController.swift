//
//  ViewController.swift
//  Toss
//
//  Created by SUN on 2022/04/03.
//

import UIKit
import Tabman

class ViewController: UIViewController {

    @IBOutlet weak var firstView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        attributes()
    }
    
    private func attributes() {
        firstView.layer.cornerRadius = 10
    }


}

