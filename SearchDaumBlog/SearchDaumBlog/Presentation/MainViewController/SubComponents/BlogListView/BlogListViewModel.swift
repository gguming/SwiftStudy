//
//  BlogListViewModel.swift
//  SearchDaumBlog
//
//  Created by 장희선 on 2022/01/12.
//

import RxSwift
import RxCocoa

struct BlogListViewModel {
    // 헤더뷰 때문에 필요함
    let filterViewModel = FilterViewModel()
    
    let blogCellData = PublishSubject<[BlogListCellData]>()
    let cellData: Driver<[BlogListCellData]>
    
    init() {
        self.cellData = blogCellData
            .asDriver(onErrorJustReturn: [])
    }
}
