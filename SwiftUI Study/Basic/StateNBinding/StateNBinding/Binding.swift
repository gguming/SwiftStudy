//
//  Binding.swift
//  StateNBinding
//
//  Created by 장희선 on 2022/01/20.
//

import SwiftUI

struct Binding: View {
    @State var name: String = ""
    
    func printName() {
        print(name)
    }
    
    var body: some View {
        VStack {
            Text(name)
            TextField("Enter your name", text: $name)
                .padding(12)
            Button(
                action: printName,
                label: {
                    Text("show Name Value")
                })
        }
    }
}

struct Binding_Previews: PreviewProvider {
    static var previews: some View {
        Binding()
    }
}
