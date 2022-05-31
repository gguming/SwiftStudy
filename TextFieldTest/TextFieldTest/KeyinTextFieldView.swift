//
//  KeyinTextFieldView.swift
//  TextFieldTest
//
//  Created by 장희선 on 2022/05/27.
//

import Foundation
import SwiftUI

//struct KeyinTextFieldView: UIViewRepresentable {
//    @Binding var text: String
//    @Binding
//    var placeHolder: String = ""
//    var isSecureTextEntry: Bool = false
//
//    class Coordinator: NSObject, UITextFieldDelegate {
//        let myTextField: KeyinTextFieldView
//
//        init(_ textField: KeyinTextFieldView) {
//            self.myTextField = textField
//        }
//
//        func textFieldDidChangeSelection(_ textField: UITextField) {
//            myTextField.text = textField.text ?? ""
//        }
//
//    }
//    func makeCoordinator() -> Coordinator {
//        return Coordinator(self)
//    }
//
//
//
//    func makeUIView(context: Context) -> UITextField {
//        let textField = UITextField(frame: .zero)
//        textField.delegate = context.coordinator
//        textField.placeholder = placeHolder
//        textField.keyboardType = .numberPad
//        textField.isSecureTextEntry = isSecureTextEntry
//
//        return textField
//    }
//
//    func updateUIView(_ uiView: UITextField, context: Context) {
//        <#code#>
//    }
//
//
//
    
    
    
//    let label: String
//    @Binding var text: String
//
//    var focusable: Binding<[Bool]>? = nil
//    var isSecureTextEntry: Binding<Bool>? = nil
//
//    var returnKeyType: UIReturnKeyType = .default
//    var autocapitalizationType: UITextAutocapitalizationType = .none
//    var keyboardType: UIKeyboardType = .numberPad
//    var textContentType: UITextContentType? = nil
//
//    var tag: Int? = nil
//    var inputAccessoryView: UIToolbar? = nil
//    var maxLength: Int? = nil
//
//    var onCommit: (() -> Void)? = nil
//
//    func makeUIView(context: Context) -> UITextField {
//        let textField = UITextField(frame: .zero)
//        textField.delegate = context.coordinator
//        textField.placeholder = label
//
//        textField.returnKeyType = returnKeyType
//        textField.autocapitalizationType = autocapitalizationType
//        textField.keyboardType = keyboardType
//        textField.isSecureTextEntry = isSecureTextEntry?.wrappedValue ?? false
//        textField.textContentType = textContentType
//        textField.textAlignment = .left
//
//        if let tag = tag {
//            textField.tag = tag
//        }
//
//        textField.inputAccessoryView = inputAccessoryView
//        textField.addTarget(context.coordinator, action: #selector(Coordinator.textFieldDidChange(_:)), for: .editingChanged)
//
//        textField.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
//
//        return textField
//    }
//
//    func updateUIView(_ uiView: UITextField, context: Context) {
//        uiView.text = text
//
//        if let focusable = focusable?.wrappedValue {
//            var resignResponder = true
//
//            for (index, focused) in focusable.enumerated() {
//                if uiView.tag == index && focused {
//                    uiView.becomeFirstResponder()
//                    resignResponder = false
//                    break
//                }
//            }
//
//            if resignResponder {
//                uiView.resignFirstResponder()
//            }
//        }
//    }
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//
//    final class Coordinator: NSObject, UITextFieldDelegate {
//        let control: KeyinTextFieldView
//
//        init(_ control: KeyinTextFieldView) {
//            self.control = control
//        }
//
//        func textFieldDidBeginEditing(_ textField: UITextField) {
//            guard var focusable = control.focusable?.wrappedValue else { return }
//
//            for i in 0...(focusable.count - 1) {
//                focusable[i] = (textField.tag == i)
//            }
//
//            control.focusable?.wrappedValue = focusable
//        }
//
//        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//            guard var focusable = control.focusable?.wrappedValue else {
//                textField.resignFirstResponder()
//                return true
//            }
//
//            for i in 0...(focusable.count - 1) {
//                focusable[i] = (textField.tag + 1 == i)
//            }
//
//            control.focusable?.wrappedValue = focusable
//
//            if textField.tag == focusable.count - 1 {
//                textField.resignFirstResponder()
//            }
//
//            return true
//        }
//
//        func textFieldDidEndEditing(_ textField: UITextField) {
//            control.onCommit?()
//        }
//
//        @objc func textFieldDidChange(_ textField: UITextField) {
//            control.text = textField.text ?? ""
//        }
//    }
//}

//struct KeyinTextFieldView_Previews: PreviewProvider {
//    static var previews: some View {
//        KeyinTextFieldView(
//    }
//}
