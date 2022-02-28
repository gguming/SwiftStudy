//
//  MyTextAlertView.swift
//  WebViewTest
//
//  Created by 장희선 on 2022/02/28.
//

import SwiftUI
import UIKit

struct MyTextAlertView: UIViewControllerRepresentable {
    @EnvironmentObject var webVM: WebViewModel
    @Binding var textString: String
    @Binding var showAlert: Bool
    
    var title: String?
    var message: String?
    
    // 처음에 한번 실행
    func makeUIViewController(context: UIViewControllerRepresentableContext<MyTextAlertView>) -> UIViewController {
        return UIViewController()
    }
    
    // 값이 변경되면 업데이트 됨
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<MyTextAlertView>) {
        // uialertcontroller가 없으면 띄우겠다
        guard context.coordinator.uiAlertController == nil else {return}
        
        //
        if self.showAlert {
            // alert를 띄운다
            let uiAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            uiAlertController.addTextField(configurationHandler: { textField in
                textField.placeholder = "전달할 값을 입력하세요"
                textField.text = textString
            })
            
            uiAlertController.addAction(UIAlertAction(title: "취소", style: .destructive, handler: { _ in
                print("취소 클릭")
                textString = ""
            }))
            uiAlertController.addAction(UIAlertAction(title: "보내기", style: .default, handler: { _ in
                print("취소 클릭")
                if let textField = uiAlertController.textFields?.first,
                   let inputText = textField.text {
                    textString = inputText
                }
                uiAlertController.dismiss(animated: true, completion:  {
                    print("보내기버튼 클릭")
                    self.webVM.nativeToJsEvent.send(textString)
                    self.textString = ""
                    showAlert = false
                })
            }))
            
            DispatchQueue.main.async {
                uiViewController.present(uiAlertController, animated: true, completion: {
                    showAlert = false
                    context.coordinator.uiAlertController = nil
                })
            }
        }
        
        
    }
    
    // uikit에 발생하는 이벤트를(delegate)를 swiftui에서 받을 수 있도록 해주는 기능
    func makeCoordinator() -> MyTextAlertView.Coordinator {
        MyTextAlertView.Coordinator(self)
    }
    
    // 중간 매개체 uikit의 delegate 등의 이벤트를 받아주는 역할
    class Coordinator: NSObject {
        var uiAlertController: UIAlertController? // uikit view
        
        var myTextAlerView: MyTextAlertView // swiftui view
        
        init(_ myTextAlertView: MyTextAlertView) {
            self.myTextAlerView = myTextAlertView
        }
    }
}

extension MyTextAlertView.Coordinator: UITextFieldDelegate {
    //글자가 입력이 될때
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text as NSString? {
            self.myTextAlerView.textString = text.replacingCharacters(in: range, with: string)
        } else {
            self.myTextAlerView.textString = ""
        }
        return true
    }
}




