//
//  LocationInformationViewModel.swift
//  CVS
//
//  Created by 장희선 on 2022/01/25.
//

import RxSwift
import RxCocoa


struct LocationInformationViewModel {
    let disposeBag = DisposeBag()
    let currentLocationButtonTapped = PublishRelay<Void>()
    
    //viewModel -> view
    let setMapCenter: Signal<MTMapPoint>
    let errorMessage: Signal<String>
    
    //view -> viewModel
}
