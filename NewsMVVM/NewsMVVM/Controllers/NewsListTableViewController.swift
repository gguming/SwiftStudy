//
//  NewsListTableViewController.swift
//  NewsMVVM
//
//  Created by 장희선 on 2022/01/18.
//

import Foundation
import UIKit


class NewsListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
