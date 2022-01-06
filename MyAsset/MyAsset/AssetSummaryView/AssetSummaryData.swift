//
//  AssetSummaryData.swift
//  MyAsset
//
//  Created by SUN on 2022/01/05.
//

import SwiftUI

class AssetSummaryData: ObservableObject {
    // 어떠한 데이터를 내보낼지 표현
    @Published var assets: [Asset] = load("assets.json")
}

// 파일 이름을 입력하면 디코딩 해주는 함수
func load<T: Decodable>(_ fileName: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        fatalError(fileName + "을 찾을 수 없습니다.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError(fileName + "을 찾을 수 없습니다.")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError(fileName + "을 파싱할 수 없습니다.")
    }
}
