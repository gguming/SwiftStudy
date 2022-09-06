//
//  ViewController.swift
//  Dynamic_Font
//
//  Created by SUN on 2022/08/30.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Cert_BG.PNG")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.minimums
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        [imageView]
            .forEach({view.addSubview($0)})
        
        
        imageView.snp.makeConstraints({
            $0.edges.equalToSuperview()
            $0.width.equalTo(imageView.snp.height).multipliedBy(1009.0/1438.0)
        })
    }
    
    
}

