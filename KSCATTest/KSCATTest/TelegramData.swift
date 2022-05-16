//
//  TelegramData.swift
//  KSCATTest
//
//  Created by 장희선 on 2022/05/16.
//

import Foundation

enum InputFeatureType {
    case Credit
    case CashReceipt
}

enum InputActionType {
    case Approval
    case Cancel
}

enum InputReceiptType: Int {
    case Individual = 0  // 개인 소득공제
    case Business = 1    // 사업자 지출증빙
}

enum InputReasonType: Int {
    case NotSet = 0
    case Cancel = 10
    case Error = 20
    case Other = 30
}

enum InputCreditCardType {
    case Normal
    case Union
}

enum RequestCode: String {
    case NotSet = "    "
    case Approval = "0200"
    case CancelWithVANTR = "0420"
    case CancelWithoutNumber = "0440"
    case CancelWithApprovalNo = "0460"
}

enum ResponseCode: String {
    case NotSet = "   "
    case Approval = "0210"
    case CancelWithVANTR = "0430"
    case CancelWithoutNumber = "0450"
    case CancelWithApprovalNo = "0470"
}

enum ResponseStatus: String {
    case NotSet = ""
    case Success = "O"
    case Rejected = "X"
}

enum ResponseCardType: String {
    case NotSet = ""
    case Normal = "N"
    case Gift = "G"
    case Check = "C"
    case AdvPay = "P"
    case OCB = "O"
    case KBMom = "B"
    case Visa = "V"
    case Master = "M"
    case JCB = "J"
    case Amex = "A"
    case Diners = "D"
    case Discover = "R"
    case Union = "U"
}

// 거래구분
enum TransactionType: String {
    case NotSet = ""
    case CreditMS = "MS"
    case CreditIC = "IC"
    case Integrated = "TO"
    case Cash = "HK"
    case Point = "PC"
    case Check = "CH"
    case Fast = "SP" //빠른현장결제
    case CreditWithPoint = "MP"
}

enum OperationType: String {
    case NotSet = ""
    case Normal = "N"
    case NormalHexaEncrypted = "n"
    case BCPartners = "P"
    case KEBYesPlus = "Y"
    case DCCApproval = "D"
    case TaxRefund = "T"
}

// 업무구분
enum ActionType: String {
    case NotSet = ""
    case Approval = "01"
    case Auth = "02"
    case ApprovalAndAuth = "03"
    case CreditMSAndPoint = "04"
    case DiscountApproval = "09"
    case CreditPoint = "10"
    case Royalty = "11"
    case RoyaltyRuleFileDownload = "12"
    case DCC = "13"
    case Delete = "40"
    case SSGPay = "25"
}

struct SocketResponseData {
    var transactionType: TransactionType
    var actionType: ActionType
    var responseCode: ResponseCode
    var operationType: OperationType
    var posDeviceNo: String
    var companyInformation: String
    var paragraphSerial: String
    var responseStatus: ResponseStatus
    var ksnetResponseCode: String
    var cardCompanyResponse: String
    var transactionDateString: String
    var transactionDate: Date
    var cardType: ResponseCardType
    var messageFirst: String
    var messageSecond: String
    var approvalNumber: String
    var transactionUniqueNo: String
    var storeNumber: String
    var issuerCode: String
    var cardName: String
    var buyerCode: String
    var buyerName: String
    var workingKeyIndex: String
    var workingKey: String
    var leftAmount: Int
    var pointFirst: Int
    var pointSecond: Int
    var pointThird: Int
    var noticeFirst: String
    var noticeSecond: String
    var reserved: String
    var ksnetReserved: String
    var filler: String
    var dccData: String
    var additionalData: Data
    
    init() {
        transactionType = .NotSet       // 거래구분
        actionType = .NotSet            // 업무구분
        responseCode = .NotSet          // 전문구분
        operationType = .NotSet         // 거래형태
        posDeviceNo = ""                // 단말기번호
        companyInformation = ""         // 업체정보
        paragraphSerial = ""            // 전문일련번호
        responseStatus = .NotSet        // status
        ksnetResponseCode = ""          // 표준응답코드
        cardCompanyResponse = ""        // 카드사응답코드
        transactionDateString = ""      // 거래일시
        transactionDate = Date()
        cardType = .NotSet              // 카드타입
        messageFirst = ""               // 메세지1
        messageSecond = ""              // 메세지2
        approvalNumber = ""             // 승인번호
        transactionUniqueNo = ""        // 거래고유번호
        storeNumber = ""                // 가맹점번호
        issuerCode = ""                 // 발급사코드
        cardName = ""                   // 카드종류명
        buyerCode = ""                  // 매입사코드
        buyerName = ""                  // 매입사명
        workingKeyIndex = ""            // working key idx
        workingKey = ""                 // working key
        leftAmount = 0                  // 잔액
        pointFirst = 0                  // 포인트1 (발생포인트)
        pointSecond = 0                 // 포인트2 (가용포인트)
        pointThird = 0                  // 포인트3 (누적포인트)
        noticeFirst = ""                // notice1
        noticeSecond = ""               // notice2
        reserved = ""                   // reserved
        ksnetReserved = ""              // ksnet reserved
        filler = ""                     // filler
        dccData = ""                    // dcc
        additionalData = Data()
    }
}

