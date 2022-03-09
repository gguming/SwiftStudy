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
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=12e4f565e6064e99934dbd7df71f8b58")!
        WebService().getArticles(url: url) { _ in
            
        }
    }
}
