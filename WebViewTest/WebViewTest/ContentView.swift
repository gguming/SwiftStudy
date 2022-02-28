//
//  ContentView.swift
//  WebViewTest
//
//  Created by 장희선 on 2022/02/28.
//

import SwiftUI
import WebKit

struct ContentView: View {
    
    @EnvironmentObject var myWebVM: WebViewModel
    
    @State var jsAlert: JsAlert?
    @State var textString = ""
    @State var shouldShowAlert = false
    @State var webTitle: String = ""
    
    var body: some View {
        NavigationView  {
            
            ZStack {
                VStack {
                    MyWebView(urlToLoad: "https://tuentuenna.github.io/simple_js_alert/")
                    webViewBottomTabbar
                }
                .navigationBarTitle(Text(webTitle),
                                    displayMode: .inline)
                .navigationBarItems(
                    leading: siteMenu,
                    trailing: Button("iOS -> Js") {
                        print("클릭클릭")
                        self.shouldShowAlert.toggle()
                    
                    }
                )
                .alert(item: $jsAlert, content: { alert in
                    createAlert(alert)
                })
                if self.shouldShowAlert {
                    createTextAlert()
                }
//                Text(textString)
//                    .font(.system(size: 26))
//                    .fontWeight(.bold)
//                    .background(Color.yellow)
//                    .offset(y: -(UIScreen.main.bounds.height * 0.3))
                
            }
            .onReceive(myWebVM.webTitleSubject,
                       perform: {receivedWebTitle in
                print("ContentView - receivedWebTitle: ", receivedWebTitle)
                self.webTitle = receivedWebTitle
            })
            .onReceive(myWebVM.jsAlertEvent, perform: {jsAlert in
                print("ContentView - jsAlert: ", jsAlert)
                self.jsAlert = jsAlert
            })
        }
    }
    // 사이트 메뉴
    var siteMenu: some View {
        Text("사이트 이동")
            .foregroundColor(.blue)
            .contextMenu(ContextMenu(menuItems: {
                Button(action: {
                    print("테스트 앱뷰")
                    myWebVM.changedUrlSubject.send(.TESTURL)
                }, label: {
                    Text("웹뷰")
                })
                Button(action: {
                    print("네이버")
                    myWebVM.changedUrlSubject.send(.NAVER)
                }, label: {
                    Text("네이버")
                })
                Button(action: {
                    print("구글")
                    myWebVM.changedUrlSubject.send(.GOOGLE)
                }, label: {
                    Text("구글")
                })
            })
            )
    }
    
    
    // 웹뷰 바텀 탭바
    var webViewBottomTabbar : some View {
        VStack {
            Divider()
            HStack {
                Spacer()
                Button(action: {
                    print("뒤로가기")
                    self.myWebVM.webNavigationSubject.send(.Back)
                }, label: {
                    Image(systemName: "arrow.backward")
                        .font(.system(size: 20))
                })
                Group {
                    Spacer()
                    Divider()
                    Spacer()
                }
                Button(action: {
                    print("앞으로가기")
                    self.myWebVM.webNavigationSubject.send(.Forward)
                }, label: {
                    Image(systemName: "arrow.forward")
                        .font(.system(size: 20))
                })
                Group {
                    Spacer()
                    Divider()
                    Spacer()
                }
                Button(action: {
                    print("새로고침")
                    self.myWebVM.webNavigationSubject.send(.Refresh)
                }, label: {
                    Image(systemName: "goforward")
                        .font(.system(size: 20))
                })
                Spacer()
                
            }
            .frame(height: 48)
            Divider()
        }
    }
}

extension ContentView {
    //
    func createAlert(_ alert: JsAlert) -> Alert {
        Alert(title: Text(alert.type.description),
              message: Text(alert.message),
              dismissButton: .default(Text("확인"), action: {
            print("알림창 확인 버튼 클릭")
        }))
    }
    
    // 텍스트 입력 alert
    func createTextAlert() -> MyTextAlertView {
        MyTextAlertView(textString: $textString, showAlert: $shouldShowAlert, title: "iOS -> Js", message: "")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
