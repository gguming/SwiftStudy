//
//  SearchBarViewModel.swift
//  SearchDaumBlog
//
//  Created by 장희선 on 2022/01/12.
//

import RxSwift
import RxCocoa

struct SearchBarViewModel {
    let queryText = PublishRelay<String?>()
    let searchButtonTapped = PublishRelay<Void>()
    
    // SearchBar 외부로 방출할 이벤트
    
    var shouldLoadResult: Observable<String>
    init() {
        self.shouldLoadResult = searchButtonTapped
            .withLatestFrom(queryText) { $1 ?? ""}
            .filter {!$0.isEmpty }
            .distinctUntilChanged()
    }
}
