//
//  PriceTextFieldCellViewModel.swift
//  CarratMarketUpload
//
//  Created by SUN on 2022/01/12.
//

import RxSwift
import RxCocoa

struct PriceTextFieldCellViewModel {
    // viewModel -> View
    let showFreeShareButton: Signal<Bool>
    let resetPrice: Signal<Void>
    
    // view -> viewMdoel
    let priceValue = PublishRelay<String?>()
    let freeShareButtonTapped = PublishRelay<Void>()
    
    init() {
        showFreeShareButton = Observable
            .merge(
                priceValue.map {$0 ?? "" == "0"},
                freeShareButtonTapped.map { _ in false}
            )
            .asSignal(onErrorJustReturn: false)
        
        resetPrice = freeShareButtonTapped
            .asSignal(onErrorSignalWith: .empty())
    }
}
