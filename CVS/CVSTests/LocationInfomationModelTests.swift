//
//  LocationInfomationModelTests.swift
//  CVSTests
//
//  Created by 장희선 on 2022/02/03.
//

import XCTest
import Nimble

@testable import CVS

class LocationInfomationModelTests: XCTestCase {
    
    let stubNetwork = LocalNetworkStub()
    
    var doc: [KLDocument]!
    var model: LocationInformationModel!

    override func setUp() {
        self.model = LocationInformationModel(localNetwork: stubNetwork)
        self.doc = cvsList
    }
    
    func testDocumentsToCellData() {
        let cellData = model.documentsToCellData(doc) // 실제 모델의 값
        let placeName = doc.map { $0.placeName } // dummy 값
        let address0 = cellData[1].address // 실제 모델의 값
        let roadAddressName = doc[1].roadAddressName // dummy 값
        
        expect(cellData.map { $0.placeName }).to(
            equal(placeName),
        description: "DetailListCellData의 placeName은 document의 placeName이다.")
        
        expect(address0).to(
            equal(roadAddressName),
            description: "KLDocument의 RoadAddressName이 빈 값이 아닐 경우 roadAdderss가 cellData에 전달된다."
        )
    }

}
