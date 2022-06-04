//
//  ContentView.swift
//  TextFieldTest
//
//  Created by 장희선 on 2022/05/27.
//

import SwiftUI

struct ContentView: View {
    //    @State private var numberOfCells: Int = 4
    //    @State private var currentlySelectedCell = 0
    
    @State var firstName = ""
    @State var lastName = ""
    @State var text = ""
    @State var text1 = ""
    @State var focused: [Bool] = [true, false, false, false]
    
    @State private var numberOfCells: Int = 4
        @State private var currentlySelectedCell = 0

        var body: some View {
            HStack {
                ForEach(0 ..< self.numberOfCells, id: \.self) { index in
                    CharacterInputCell(currentlySelectedCell: self.$currentlySelectedCell, isfocusAble: $focused, index: index, tag: index)
                }
            }
        }
}

//struct TextFieldTyped: UIViewRepresentable {
//    let keyboardType: UIKeyboardType
//    let returnVal: UIReturnKeyType
//    let tag: Int
//    @Binding var text: String
//    @Binding var isfocusAble: [Bool]
//
//    func makeUIView(context: Context) -> UITextField {
//        let textField = UITextField(frame: .zero)
//        textField.keyboardType = self.keyboardType
//        textField.returnKeyType = self.returnVal
//        textField.tag = self.tag
//        textField.delegate = context.coordinator
//        textField.autocorrectionType = .no
//
//        return textField
//    }
//
//    func updateUIView(_ uiView: UITextField, context: Context) {
//        if isfocusAble[tag] {
//            uiView.becomeFirstResponder()
//        } else {
//            uiView.resignFirstResponder()
//        }
//    }
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//
//    class Coordinator: NSObject, UITextFieldDelegate {
//        var parent: TextFieldTyped
//
//        init(_ textField: TextFieldTyped) {
//            self.parent = textField
//        }
//
//        func updatefocus(textfield: UITextField) {
//            textfield.becomeFirstResponder()
//        }
//
//
//        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//            let currentText = textField.text ?? ""
//
//            guard let stringRange = Range(range, in: currentText) else { return false }
//
//            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
//
//            if updatedText.count == 4 {
//                //            self.currentlySelectedCell += 1
//                switch parent.tag {
//                case 0:
//                    parent.isfocusAble = [false, true, false, false]
//                    parent.text = textField.text ?? ""
//                case 1:
//                    parent.isfocusAble = [false, false, true, false]
//                    parent.text = textField.text ?? ""
//                case 2:
//                    parent.isfocusAble = [false, false, false, true]
//                    parent.text = textField.text ?? ""
//                case 3:
//                    parent.isfocusAble = [false, false, false, false]
//                    parent.text = textField.text ?? ""
//                default:
//                    print(11)
//                }
//            }
//
//            return updatedText.count <= 4
//        }
//
//    }
//
//
//}

//struct SectionedTextField: View {
//    @State private var numberOfCells: Int = 8
//    @State private var currentlySelectedCell = 0
//
//    var body: some View {
//        HStack {
//            ForEach(0 ..< self.numberOfCells, id: \.self) { index in
//                CharacterInputCell(currentlySelectedCell: self.$currentlySelectedCell, index: index, tag: index)
//            }
//        }
//    }
//}


struct CharacterInputCell: View {
    @State private var textValue: String = ""
    @Binding var currentlySelectedCell: Int
    @Binding var isfocusAble: [Bool]
    var index: Int
    var tag: Int

    var responder: Bool {
        print(index == currentlySelectedCell)
        print(index)
        print(currentlySelectedCell)
        print("=====================")
        return index == currentlySelectedCell
    }

    var body: some View {
        CustomTextField(text: $textValue, currentlySelectedCell: $currentlySelectedCell, isfocusAble: $isfocusAble, index: index, isFirstResponder: responder, tag: tag)
            .frame(height: 20)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding([.trailing, .leading], 10)
            .padding([.vertical], 15)
            .lineLimit(1)
            .multilineTextAlignment(.center)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.red.opacity(0.5), lineWidth: 2)
            )
    }
}

struct CustomTextField: UIViewRepresentable {

    @Binding var text: String
    @Binding var currentlySelectedCell: Int
    @Binding var isfocusAble: [Bool]
    var index: Int
    var isFirstResponder: Bool = false
    var tag: Int

    class Coordinator: NSObject, UITextFieldDelegate {

        var myTextField: CustomTextField

        @Binding var text: String
        @Binding var currentlySelectedCell: Int

        var didBecomeFirstResponder = false
        init(text: Binding<String>, currentlySelectedCell: Binding<Int>, myTextField: CustomTextField) {
            _text = text
            _currentlySelectedCell = currentlySelectedCell
            self.myTextField = myTextField
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            DispatchQueue.main.async {
                self.text = textField.text ?? ""
                self.currentlySelectedCell = textField.tag
                print("이것때문에 그런거지")
//                self.didBecomeFirstResponder = false
//                print(self.currentlySelectedCell)
//                print(self.myTextField.tag)
                if self.text.count < 4 {
                switch self.myTextField.tag {
                case 0:
                    self.myTextField.isfocusAble = [true, false, false, false]
                    self.myTextField.text = textField.text ?? ""
                case 1:
                    self.myTextField.isfocusAble = [false, true, false, false]
                    self.myTextField.text = textField.text ?? ""
                case 2:
                    self.myTextField.isfocusAble = [false, false, true, false]
                    self.myTextField.text = textField.text ?? ""
                case 3:
                    self.myTextField.isfocusAble = [false, false, false, true]
                    self.myTextField.text = textField.text ?? ""
                default:
                    print(11)
                }
                }
//
            }
        }

        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            let currentText = textField.text ?? ""

            guard let stringRange = Range(range, in: currentText) else { return false }

            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
            print(updatedText)
            if updatedText.count == 4 && myTextField.tag != 3 {
                self.currentlySelectedCell = myTextField.tag + 1
//                didBecomeFirstResponder = false
                switch self.myTextField.tag {
                               case 0:
                                   self.myTextField.isfocusAble = [false, true, false, false]
                                   self.myTextField.text = textField.text ?? ""
                               case 1:
                                   self.myTextField.isfocusAble = [false, false, true, false]
                                   self.myTextField.text = textField.text ?? ""
                               case 2:
                                   self.myTextField.isfocusAble = [false, false, false, true]
                                   self.myTextField.text = textField.text ?? ""
                               case 3:
                                   self.myTextField.isfocusAble = [false, false, false, false]
                                   self.myTextField.text = textField.text ?? ""
                               default:
                                   print(11)
                               }
            }

            return updatedText.count <= 4
        }

    }
    func makeUIView(context: UIViewRepresentableContext<CustomTextField>) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.delegate = context.coordinator
        textField.textAlignment = .center
        textField.keyboardType = .decimalPad
        textField.tag = tag
        return textField
    }

    func makeCoordinator() -> CustomTextField.Coordinator {
        return Coordinator(text: $text, currentlySelectedCell: $currentlySelectedCell, myTextField: self)
    }

    func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<CustomTextField>) {
        uiView.text = text
//        if //uiView.tag == currentlySelectedCell {
//            isFirstResponder && !context.coordinator.didBecomeFirstResponder  {
//            uiView.becomeFirstResponder()
//            print("여기서 바뀌는건가")
//            context.coordinator.didBecomeFirstResponder = true
        if isfocusAble[tag] {
                   uiView.becomeFirstResponder()
               } else {
                   uiView.resignFirstResponder()
               }
        
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
