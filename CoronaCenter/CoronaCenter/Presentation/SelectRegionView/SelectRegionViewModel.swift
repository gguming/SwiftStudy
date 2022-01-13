//
//  SelectRegionViewModel.swift
//  CoronaCenter
//
//  Created by 장희선 on 2022/01/13.
//

import Foundation
import Combine

// ObservableObject 외부에서 바라볼 수 있는 오브젝트
class SelectRegionViewModel: ObservableObject {
    @Published var centers = [Center.Sido: [Center]]()
    private var cancellables = Set<AnyCancellable>()
    
    init(centerNetwork: CenterNetwork = CenterNetwork()) {
        centerNetwork.getCenterList()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: {[weak self] in
                    guard case .failure(let error) = $0 else {return}
                    print(error.localizedDescription)
                    self?.centers = [Center.Sido: [Center]]()
                },
                receiveValue: {[weak self] centers in
                    self?.centers = Dictionary(grouping: centers) { $0.sido }
                }
            )
            .store(in: &cancellables)
    }
}
