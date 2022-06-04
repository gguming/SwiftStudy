//
//  ContentView.swift
//  DropDownTest
//
//  Created by 장희선 on 2022/06/02.
//

import SwiftUI

struct ContentView: View {
    @State private var shouldShowDropDown = false
    @State private var selectedOption: DropDownOption? = nil
    var placeholder: String
    var options: [DropDownOption]
    var onOptionSelected: ((_ option: DropDownOption) -> Void)?
    private let buttonHeight: CGFloat = 45
    var body: some View {
        Button(action: {
            self.shouldShowDropDown.toggle()
        }) {
            HStack {
                Text(selectedOption == nil ? placeholder : selectedOption!.value)
                    .font(.system(size: 14))
                    .foregroundColor(selectedOption == nil ? Color.gray: Color.black)

                Spacer()

                Image(systemName: self.shouldShowDropDown ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
                    .resizable()
                    .frame(width: 9, height: 5)
                    .font(Font.system(size: 9, weight: .medium))
                    .foregroundColor(Color.black)
            }
        }
        .padding(.horizontal)
        .cornerRadius(5)
        .frame(width: .infinity, height: self.buttonHeight)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.gray, lineWidth: 1)
        )
        .overlay(
            VStack {
                if self.shouldShowDropDown {
                    Spacer(minLength: buttonHeight + 10)
                    Dropdown(options: self.options, onOptionSelected: { option in
                        shouldShowDropDown = false
                        selectedOption = option
                        self.onOptionSelected?(option)
                    })
                }
            }, alignment: .topLeading
        )
        .background(
            RoundedRectangle(cornerRadius: 5).fill(Color.white)
        )
    }
}

struct DropDownOption: Hashable {
    let key: String
    let value: String
    
    public static func == (lhs: DropDownOption, rhs: DropDownOption) -> Bool {
        return lhs.key == rhs.key
    }
}

struct Dropdown: View {
    var options: [DropDownOption]
    var onOptionSelected: ((_ option: DropDownOption) -> Void)?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(self.options, id: \.self) { option in
                    DropdownRow(option: option, onOptionSelected: self.onOptionSelected)
                }
            }
        }
        .frame(height: 100)
        .padding(.vertical, 5)
        .background(Color.white)
        .cornerRadius(5)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}

struct DropdownRow: View {
    var option: DropDownOption
    var onOptionSelected: ((_ option: DropDownOption) -> Void)?

    var body: some View {
        Button(action: {
            if let onOptionSelected = self.onOptionSelected {
                onOptionSelected(self.option)
            }
        }) {
            HStack {
                Text(self.option.value)
                    .font(.system(size: 14))
                    .foregroundColor(Color.black)
                Spacer()
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 5)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var uniqueKey: String {
            UUID().uuidString
        }

        static let options: [DropDownOption] = [
            DropDownOption(key: uniqueKey, value: "Sunday"),
            DropDownOption(key: uniqueKey, value: "Monday"),
            DropDownOption(key: uniqueKey, value: "Tuesday"),
            DropDownOption(key: uniqueKey, value: "Wednesday"),
            DropDownOption(key: uniqueKey, value: "Thursday"),
            DropDownOption(key: uniqueKey, value: "Friday"),
            DropDownOption(key: uniqueKey, value: "Saturday")
        ]


        static var previews: some View {
            Group {
                ContentView(
                    placeholder: "Day of the week",
                    options: options,
                    onOptionSelected: { option in
                        print(option)
                })
                .padding(.horizontal)
            }
        }
    
}

