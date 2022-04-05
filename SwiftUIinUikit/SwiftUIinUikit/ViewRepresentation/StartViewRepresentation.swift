//
//  StartViewRepresentation.swift
//  SwiftUIinUikit
//
//  Created by 장희선 on 2022/04/04.
//

import Foundation
import SwiftUI

struct StartViewRepresentation: UIViewRepresentable {
    
    @Binding var selected: Bool
    
    typealias UIViewType = StarView
    
    func makeUIView(context: Context) -> StarView {
        let starView = StarView()
        return starView
    }
    
    func updateUIView(_ uiView: StarView, context: Context) {
        uiView.selected = self.selected
    }
}
