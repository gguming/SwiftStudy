//
//  AlertActionConvertible.swift
//  SearchDaumBlog
//
//  Created by 장희선 on 2022/01/12.
//

import UIKit

protocol AlertActionConvertible {
    var title: String { get }
    var style: UIAlertAction.Style { get }
}
