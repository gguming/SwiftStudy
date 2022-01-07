//
//  Draw.swift
//  ObservableTest (iOS)
//
//  Created by 장희선 on 2022/01/07.
//

import SwiftUI

struct Draw: View {
    var body: some View {
        Circle()
            .fill(Color.red)
            .frame(width: 200, height: 200, alignment: .center)
        
        Capsule()
            .stroke(lineWidth: 10)
            .foregroundColor(.blue)
            .frame(width: 200, height: 100)
    }
}

struct Draw_Previews: PreviewProvider {
    static var previews: some View {
        Draw()
    }
}
