//
//  SampleView.swift
//  Cafe
//
//  Created by 장희선 on 2022/01/14.
//

import SwiftUI

struct ParentView: View {
    @State private var isDisabled = true
    var body: some View {
        SampleView(isDisabled: $isDisabled)
    }
}

struct SampleView: View {
//    @State private var currentText = ""
//    @State private var isDisabled = true
    @Binding var isDisabled: Bool
    var body: some View {
//        VStack{
//            TextField("텍스트를 입력해주세요.",
//                      text: $currentText)
//            Text(currentText)
//        }

        
        VStack {
            Toggle(
                isOn: $isDisabled,
                label: {
                Text("버튼을 비활성화 하세요")
            })
            
            Button("버튼") {}
            .disabled(isDisabled)
        }
    }
}

struct SampleView_Previews: PreviewProvider {
    static var previews: some View {
        ParentView()
    }
}
