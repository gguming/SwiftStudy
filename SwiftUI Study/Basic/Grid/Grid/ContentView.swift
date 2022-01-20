//
//  ContentView.swift
//  Grid
//
//  Created by 장희선 on 2022/01/20.
//

import SwiftUI

struct ContentView: View {
    let animals = ["🦘", "🐪", "🐓", "🦢", "🦧", "🐢", "🐳", "🐖"]
    @State private var sliderValue: CGFloat = 1
    var body: some View {
        NavigationView {
            
            VStack {
                Slider(value: $sliderValue, in: 1...8, step: 1)
                Text(String(format: "%.0f", sliderValue))
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(Color.white)
                    .clipShape(Circle())
                List(animals.chunks(size: Int(sliderValue)), id: \.self) { chunk in
                    HStack{
                    ForEach(chunk, id: \.self) { animal in
//                        Text(animal)
//                            .font(.system(size: 100))
                        
                        Text(animal)
                            .font(.system(size: CGFloat(300/sliderValue)))
                        
                    }
                }
                }
            }
            .navigationTitle("Animals")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
