//
//  UserInputData.swift
//  KSCATTest
//
//  Created by 장희선 on 2022/05/16.
//

import Foundation


struct InternalInputData {
    let featureCase: InputFeatureType
    let actionCase: InputActionType
    let cashCancelCase: InputReasonType
    let inputDeviceNumber: String
    let inputAmount: Int
    let installMonth: Int
    let cashReceiptNumber: String
    let approvalNumber: String
    let approvalDate: String

    init(type: InputFeatureType,
         action: InputActionType,
         reason: InputReasonType = .NotSet,
         deviceNumber: String = "",
         amount: Int = 0,
         install: Int = 0,
         receiptType: InputReceiptType = .Individual,
         receiptNumber: String = "",
         approval: String = "",
         inputDate: String = "") {
        featureCase = type
        actionCase = action
        cashCancelCase = reason
        inputDeviceNumber = deviceNumber
        inputAmount = amount
        if type == .CashReceipt {
            var firstNumber = 0
            if (action == .Cancel) {
                firstNumber = reason.rawValue
            }
            var secondNumber = 0
            if receiptType == .Business {
                secondNumber = 1
            }
            installMonth = firstNumber + secondNumber
        } else {
            installMonth = install
        }
        cashReceiptNumber = receiptNumber
        approvalNumber = approval
        approvalDate = inputDate
    }
    
}

enum UserInputValidationState {
    case Ready
    case EmptyDeviceNumber
    case EmptyApprovalNumber
    case InvalidApprovalDate
    case EmptyInstallMonth
    case EmptyAmount
    case EmptyReceiptNumber
    case InvalidReceiptNumber
    case Pass
    case SendToCancelView
}

struct UserInputData {
    var inputData: InternalInputData?
    var state: UserInputValidationState
    
    init() {
        state = .Ready
    }
}
