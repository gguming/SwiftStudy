//
//  ViewModel.swift
//  KSCATTest
//
//  Created by 장희선 on 2022/05/16.
//

import Foundation
import Combine


class ViewModel: ObservableObject {
    var changeURLSubject = PassthroughSubject<String, Never>()
}
