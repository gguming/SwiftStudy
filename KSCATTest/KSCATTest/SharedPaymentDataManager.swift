//
//  SharedPaymentDataManager.swift
//  KSCATTest
//
//  Created by 장희선 on 2022/05/16.
//

import Foundation


class SharedPaymentDataManager {
    static let shared = SharedPaymentDataManager()
    private init() {}
    
    func parseSocketReceivedData(_ data: Data) -> SocketResponseData{
        print("responseData = \(data.base64EncodedString())")
        var result = SocketResponseData()
        if data.count > 0 {
            let transactionType = getEncodedEucKRString(from: data[5...6])
            result.transactionType = TransactionType(rawValue: transactionType) ?? .NotSet
            let actionType = getEncodedEucKRString(from: data[7...8])
            result.actionType = ActionType(rawValue: actionType) ?? .NotSet
            let responseCode = getEncodedEucKRString(from: data[9...12])
            result.responseCode = ResponseCode(rawValue: responseCode) ?? .NotSet
            let operationType = getEncodedEucKRString(from: data[13])
            result.operationType = OperationType(rawValue: operationType) ?? .NotSet
            result.posDeviceNo = getEncodedEucKRString(from: data[14...23])
            result.companyInformation = getEncodedEucKRString(from: data[24...27])
            result.paragraphSerial = getEncodedEucKRString(from: data[28...39])
            let status = getEncodedEucKRString(from: data[40])
            result.responseStatus = ResponseStatus(rawValue: status) ?? .Rejected
            result.ksnetResponseCode = getEncodedEucKRString(from: data[41...44])
            result.cardCompanyResponse = getEncodedEucKRString(from: data[45...48])
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyMMddHHmmss"
            result.transactionDateString = getEncodedEucKRString(from: data[49...60])
            result.transactionDate = dateFormatter.date(from: result.transactionDateString)!
            let cardType = getEncodedEucKRString(from: data[61])
            result.cardType = ResponseCardType(rawValue: cardType) ?? .NotSet
            result.messageFirst = getEncodedEucKRString(from: data[62...77])
            result.messageSecond = getEncodedEucKRString(from: data[78...93])
            result.approvalNumber = getEncodedEucKRString(from: data[94...105])
            result.transactionUniqueNo = getEncodedEucKRString(from: data[106...125])
            result.storeNumber = getEncodedEucKRString(from: data[126...140])
            result.issuerCode = getEncodedEucKRString(from: data[141...142])
            result.cardName = getEncodedEucKRString(from: data[143...158])
            result.buyerCode = getEncodedEucKRString(from: data[159...160])
            result.buyerName = getEncodedEucKRString(from: data[161...176])
            result.workingKeyIndex = getEncodedEucKRString(from: data[177...178])
            result.workingKey = getEncodedEucKRString(from: data[179...194])
            result.leftAmount = Int(getEncodedEucKRString(from: data[195...203])) ?? 0
            result.pointFirst = Int(getEncodedEucKRString(from: data[204...212])) ?? 0
            result.pointSecond = Int(getEncodedEucKRString(from: data[213...221])) ?? 0
            result.pointThird = Int(getEncodedEucKRString(from: data[222...230])) ?? 0
            result.noticeFirst = getEncodedEucKRString(from: data[231...250])
            result.noticeSecond = getEncodedEucKRString(from: data[251...290])
            result.reserved = getEncodedEucKRString(from: data[291...295])
            result.ksnetReserved = getEncodedEucKRString(from: data[296...335])
            result.filler = getEncodedEucKRString(from: data[336...365])
            result.dccData = getEncodedEucKRString(from: data[366...455])
        }
        return result
    }
    
    func parseUrl(_ url: URL) {
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
              let queryItems = components.queryItems else {return}

        for item in queryItems {
            switch item.name {
            case "paragram":
                guard let dataString = item.value,
                      let data = Data(base64Encoded: dataString)
//                      let resultVC = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "ResultViewController") as? ResultViewController
                else {return}

                let parsedResponseData = parseSocketReceivedData(data)
                let stringResponseTelegram = getEncodedEucKRString(from: data)

                if parsedResponseData.responseStatus == .Success {
//                    let topVC = UIApplication.topViewController()
//
//                    if topVC is CreditViewController
//                    {
//                        let vc = topVC as? CreditViewController
//                        vc?.setApprovalInfo(parsedResponseData.approvalNumber, parsedResponseData.transactionDate)
//                    }
//                    else if topVC is CashViewController
//                    {
//                        let vc = topVC as? CashViewController
//                        vc?.setApprovalInfo(parsedResponseData.approvalNumber, parsedResponseData.transactionDate)
//                    }
//                    topVC?.present(resultVC, animated: true) {
//                        resultVC.showResult(parsedResponseData)
//                        resultVC.showResponseTelegram(stringResponseTelegram)
                    print(parsedResponseData)
                    print(stringResponseTelegram)
//                    }
                } else {
//                    let alertBox = getRejectionAlert(data)
//                    UIApplication.topViewController()?.present(alertBox, animated: true, completion: nil)
//
                    print(parsedResponseData)
                    print(stringResponseTelegram)
                }
                break
            default:
                break
            }

        }
    }
//
//    func getRejectionAlert(_ data: Data) -> UIAlertController {
//        var alertAction: UIAlertAction
//
//        let parsedResponseData = SharedPaymentDataManager.shared.parseSocketReceivedData(data)
//        let responseTelegram = SharedPaymentDataManager.shared.getEncodedEucKRString(from: data)
//
//        let alertTitle = "TestPayRequest"
//        let alertMessage = "\n" + parsedResponseData.messageFirst + "\n" + parsedResponseData.messageSecond
//        let alertBox = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
//
//        alertBox.title = alertTitle
//        alertBox.message = alertMessage
//
//        alertAction = UIAlertAction(title: "확인", style: .default, handler: {_ in
//            guard let resultVC = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "ResultViewController") as? ResultViewController else {return}
//
//            UIApplication.topViewController()?.present(resultVC, animated: true) {
//                resultVC.showResult(parsedResponseData)
//                resultVC.showResponseTelegram(responseTelegram)
//            }
//        })
//
//        alertBox.addAction(alertAction)
//
//        return alertBox
//    }
    
    func getEncodedEucKRByteArray(from dataString:String) -> [UInt8] {
        var result:[UInt8] = []
        if let byteArray = dataString.data(using: String.Encoding(rawValue: UInt(CFStringEncoding(CFStringEncodings.EUC_KR.rawValue)))) {
            result += byteArray
        }
        return result
    }
    
    func getEncodedEucKRString(from data:Data) -> String {
        if let string = String(data: data, encoding: .init(rawValue: CFStringConvertEncodingToNSStringEncoding(0x0422))) {
            return string.trimmingCharacters(in: .whitespacesAndNewlines)
        } else {
            return ""
        }
    }
    
    func getEncodedEucKRString(from byteArray:[UInt8]) -> String {
        if let string = String(bytes: byteArray, encoding: .init(rawValue: CFStringConvertEncodingToNSStringEncoding(0x0422))) {
            return string.trimmingCharacters(in: .whitespacesAndNewlines)
        } else {
            return ""
        }
    }
    
    func getEncodedEucKRString(from singleByte:UInt8) -> String {
        if let string = String(bytes: [singleByte], encoding: .init(rawValue: CFStringConvertEncodingToNSStringEncoding(0x0422))) {
            return string.trimmingCharacters(in: .whitespacesAndNewlines)
        } else {
            return ""
        }
    }
}
