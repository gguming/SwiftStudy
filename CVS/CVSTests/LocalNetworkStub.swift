//
//  LocalNetworkStub.swift
//  CVSTests
//
//  Created by 장희선 on 2022/02/03.
//

import Foundation
import RxSwift
import Stubber

@testable import CVS

class LocalNetworkStub: LocalNetwork {
    override func getLocation(by mapPoint: MTMapPoint) -> Single<Result<LocationData, URLError>> {
        return Stubber.invoke(getLocation, args: mapPoint)
    }
}
