//
//  NavigationBarWithButton.swift
//  MyAsset
//
//  Created by SUN on 2022/01/03.
//

import SwiftUI

struct NavigationBarWithButton: ViewModifier {
    var title: String = ""
    func body(content: Content) -> some View {
        return content
            .navigationBarItems(
                leading: Text(title)
                    .font(.system(size: 24, weight: .bold))
                    .padding(),
                trailing: Button(
                    action: {
                        print("자산 버튼")
                    },
                    label: {
                        Image(systemName: "plus")
                            
                            
                        Text("자산추가")
                            .font(.system(size: 12))
                    }
                    
                )
                .accentColor(.black)
                .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4 ))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black)
                )
            )
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                let appearance = UINavigationBarAppearance()
                appearance
                    .configureWithTransparentBackground()
                appearance.backgroundColor = UIColor(white: 1, alpha: 0.5)
                UINavigationBar.appearance().standardAppearance = appearance
                // 줄어 들었을 경우
                UINavigationBar.appearance().compactAppearance = appearance
                // 스크롤했을 경우
                UINavigationBar.appearance().scrollEdgeAppearance = appearance
            }
        
    }
}

extension View {
    func navigationBarWithStyle(_ title: String) -> some View {
        return self.modifier(NavigationBarWithButton(title: title))
    }
}


// modifier인 경우 아래와 같이 수정이 필요함
struct NavigationBarWithButton_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            Color.gray.edgesIgnoringSafeArea(.all)
                .navigationBarWithStyle("내 자산")
        }
        
    }
}
