//
//  DetailListBackgroundViewModel.swift
//  CVS
//
//  Created by 장희선 on 2022/01/26.
//

import RxSwift
import RxCocoa

struct DetailListBackgroundViewModel {
    // viewModel -> View
    let isStatusLabelHidden: Signal<Bool>
    
    // 외부에서 전달받을 값
    let shouldHideStatusLabel = PublishSubject<Bool>()
    
    init() {
        isStatusLabelHidden = shouldHideStatusLabel
            .asSignal(onErrorJustReturn: true)
    }
}
