//
//  MoviesTableViewCell.swift
//  SwiftUIinUikit
//
//  Created by 장희선 on 2022/04/04.
//

import UIKit
import SnapKit

class MoviesTableViewCell: UITableViewCell {
    
    static let identifier = "MoviesTableViewCell"
    
    let img: UIImageView = UIImageView()
    let label: UILabel = UILabel()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        [img, label].forEach {
            contentView.addSubview($0)
        }
        
        img.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview().inset(10)
            $0.width.height.equalTo(50)
        }
    }
    
    
}
