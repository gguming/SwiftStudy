//
//  LocalNetwork.swift
//  CVS
//
//  Created by 장희선 on 2022/02/03.
//

import RxSwift


class LocalNetwork {
    private let session: URLSession
    let api = LocalAPI()
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func getLocation(by mapPoint: MTMapPoint) -> Single<Result<LocationData, URLError>> {
        guard let url = api.getLocatation(by: mapPoint).url else {
            return .just(.failure(URLError(.badURL)))
        }
        
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("KakaoAK adf2e3b0329b833704f0be357c7766d9", forHTTPHeaderField: "Authorization")
        
        return session.rx.data(request: request as URLRequest)
            .map { data in
                do {
                    let locationData =  try JSONDecoder().decode(LocationData.self, from: data)
                    return .success(locationData)
                } catch {
                    return .failure(URLError(.cannotParseResponse))
                }
            }
            .catch { _ in
            .just(Result.failure(URLError(.cannotLoadFromNetwork)))
            }
            .asSingle()
    }
}
