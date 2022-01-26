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

    // subviewModels
    let detailListBackgroundViewModel = DetailListBackgroundViewModel()
    
    
    //viewModel -> view
    let setMapCenter: Signal<MTMapPoint>
    let errorMessage: Signal<String>
    
    let detailListCellData: Driver<[DetailListCellData]>
    let scrollToSelectedLocation: Signal<Int>
    
    //view -> viewModel
    let currentLocation = PublishRelay<MTMapPoint>()
    let mapCenterPoint = PublishRelay<MTMapPoint>()
    let selectPOIItem = PublishRelay<MTMapPOIItem>()
    let mapViewError = PublishRelay<String>()
    let currentLocationButtonTapped = PublishRelay<Void>()
    
    let detailListItemSelected = PublishRelay<Int>()
    
    let documentData = PublishSubject<[KLDocument?]>()
    
    init() {
        //MARK: 지도 중심점 설정
        let selectedDetailListItem = detailListItemSelected
            .withLatestFrom(documentData) { $1[$0] }
            .map { data -> MTMapPoint in
                guard let data = data,
                      let longtitude = Double(data.x),
                      let latitude = Double(data.y) else {
                          return MTMapPoint()
                      }
                
                let geoCoord = MTMapPointGeo(latitude: latitude, longitude: longtitude)
                return MTMapPoint(geoCoord: geoCoord)
            }
        
        
        let moveToCurrentLocation = currentLocationButtonTapped
            .withLatestFrom(currentLocation)
        let currentMapCenter = Observable
            .merge(
                selectedDetailListItem,
                currentLocation.take(1),
                moveToCurrentLocation
            )
        
        setMapCenter = currentMapCenter
            .asSignal(onErrorSignalWith: .empty())
        
        errorMessage = mapViewError.asObservable()
            .asSignal(onErrorJustReturn: "잠시 후 다시 시도해 주세요.")
        
        detailListCellData = Driver.just([])
        
        scrollToSelectedLocation = selectPOIItem
            .map { $0.tag }
            .asSignal(onErrorJustReturn: 0)
    }
    
}
