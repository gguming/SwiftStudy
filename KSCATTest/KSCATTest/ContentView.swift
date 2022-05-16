//
//  ContentView.swift
//  KSCATTest
//
//  Created by 장희선 on 2022/05/16.
//

import SwiftUI
import WebKit

struct ContentView: View {
    
    @ObservedObject var viewModel: ViewModel = ViewModel()
    
    @State private var url: String = "https://naver.com"
    @State private var deviceNum: String = "DPT0Q19483"
    @State private var amount: String = "1004"
    @State private var installMonth: String = "00"
    
    var body: some View {
        VStack() {
            TextField("단말기번호", text: $deviceNum)
            TextField("금액", text: $amount)
            TextField("할부개월", text: $installMonth)
            
            Button {
                print("action")
                approval()
            } label: {
                Text("신용승인요청")
            }
            
            WebView(viewModel: viewModel, requestURL: url)
//                .frame(width: 0.0, height: 0.0)

        }
        .padding()
    }
}

extension ContentView {
    func approval() {
        guard let deviceNumber = deviceNum as? String,
              let amount = amount as? String,
              let installMonth = installMonth as? String else {return}
        
        let userInputValidationState = validInputApprovalData(deviceNumber: deviceNumber, amount: Int(amount) ?? -1, installMonth: Int(installMonth) ?? -1)
        
        guard userInputValidationState == .Pass else {
            setAlertMessageAndPresent(userInputValidationState)
            return
        }
        
        let reqData = setFullTextApproval().base64EncodedString()
        viewModel.changeURLSubject.send("kscat://transact?hostname=testpayrequest&paragram=\(reqData)")
    }
    
    func setAlertMessageAndPresent(_ userInputValidationState: UserInputValidationState) {
        var title: String = ""
//        var alert: UIAlertController
//        var action: UIAlertAction
        
        switch userInputValidationState {
        case .EmptyDeviceNumber:
            title = "단말기번호를 확인해주세요."
            break
        case .EmptyAmount:
            title = "금액을 확인해주세요."
            break
        case .EmptyInstallMonth:
            title = "할부개월을 확인해주세요."
            break
        case .EmptyApprovalNumber:
            title = "승인번호를 확인해주세요."
            break
        case .InvalidApprovalDate:
            title = "승인일자를 확인해주세요."
            break
        case .EmptyReceiptNumber:
            title = "현금영수증 번호를 확인해주세요."
            break
        default: break
        }
        
//        alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
//        action = UIAlertAction(title: "OK", style: .default, handler : nil)
//        alert.addAction(action)
//        present(alert, animated: false, completion: nil)
        print("title")
    }
    
    private func validInputApprovalData(deviceNumber: String, amount: Int, installMonth: Int) -> UserInputValidationState {
        
        if deviceNumber.isEmpty {
            return .EmptyDeviceNumber
        }
        
        if amount <= 0 {
            return .EmptyAmount
        }

        if installMonth < 0 {
            return .EmptyInstallMonth
        }
        
        return .Pass
    }
    
    func setFullTextApproval (
        transactionType: String = "IC",     // 거래구분
        operationType: String = "01",       // 업무구분
        telegramType: String = "0200",          // 전문구분
        transactionTypeCode: String = "N",  // 거래형태
        storeInfo:String = "",              // 업체정보
        textSerial:String = "",             // 전문일련번호
        posEntryMode:String = " ",          // Pos Entry Mode
        paymentUniqueNumber:String = "",    // 거래고유번호
        unEncrytpedCardNumber:String = "",  // 암호화하지않은카드번호
        isEncrypt:String = " ",             // 암호화 여부
        swModelNumber:String = "",          // sw모델번호
        readerModelNumber:String = "",      // CATorReader모델번호
        encryptInformation:[UInt8] = [],    // 암호화정보
        trackII:[UInt8] = [],               // 트랙2
        volunteer:String = "0",             // 봉사료
        vatAmount:String = "0",             // 세금
        workingKeyIndex:String = "  ",      // workingKeyIdx
        password:String = "",               // 비밀번호
        baseApprovedNumber:String = "",     // 원거래승인번호
        baseApprovedDate:String = "",       // 원거래승인일자
        userInfo:String = "",               // 사용자정보
        storeId:String = "",                // 가맹점ID
        storeField:String = "",             // 가맹점사용필드
        reserved:String = "",               // reserved
        ksnetReserved:String = "",          // ksnet reserved
        dongleType:String = " ",            // 동글구분
        mediaType:String = " ",             // 매체구분
        telecomType:String = " ",           // 이통사구분
        cardType:String = " ",              // 신용카드종류
        filler:String = "",                 // filler
        dccData:String = "",                // dcc
        signFlag:String = " "               // 전자서명유무
    ) -> Data {
        
        guard let deviceNumber = deviceNum as? String
        ,let totalAmount = amount as? String
        ,let installMonth = installMonth as? String else {return makeEntirePacket(from: [UInt8]())}
        
        var month = 0
        if let inputInstallMonth = Int(installMonth) {
            month = inputInstallMonth
            if month >= 0 {
                if inputInstallMonth < 2 {
                    month = 0
                }
            }
        }
        
        let proAmount = totalAmount
        let taxFreeAmount = totalAmount
        
        var dataArray:[UInt8] = []
        dataArray += [UInt8](transactionType.utf8)                                                            //거래구분
        dataArray += [UInt8](operationType.utf8)                                                            //업무구분
        dataArray += [UInt8](telegramType.utf8)                                                                    //전문구분
        dataArray += [UInt8](transactionTypeCode.utf8)                                                        //거래형태
        dataArray += fillText(from: [UInt8](deviceNumber.utf8), until: 10, fillFront: false)                //단말기번호
        dataArray += fillText(from: [UInt8](storeInfo.utf8), until: 4, fillFront: false)                    //업체정보
        dataArray += fillText(from: [UInt8](textSerial.utf8), until: 12, fillFront: false)                    //전문일련번호
        dataArray += [UInt8](posEntryMode.utf8)                                                                //POS Entry Mode
        dataArray += fillText(from: [UInt8](paymentUniqueNumber.utf8), until: 20, fillFront: false)            //거래 고유 번호
        dataArray += fillText(from: [UInt8](unEncrytpedCardNumber.utf8), until: 20, fillFront: false)        //암호화되지 않은 카드 번호
        dataArray += [UInt8](isEncrypt.utf8)                                                                //암호화 여부
        dataArray += fillText(from: [UInt8](swModelNumber.utf8), until: 16, fillWith: "#", fillFront: true)                //S/W 모델 번호
        dataArray += fillText(from: [UInt8](readerModelNumber.utf8), until: 16, fillWith: "#", fillFront: true)            //장비 모델 번호
        dataArray += fillText(from: encryptInformation, until: 40, fillFront: false)            //암호화 정보
        dataArray += fillText(from: trackII, until: 37, fillFront: false)                                    //track II
        dataArray.append(0x1C)                                                                                //FS
        dataArray += fillText(from: [UInt8](String(month).utf8), until: 2, fillWith: "0", fillFront: true)                                      //할부개월
        dataArray += fillText(from: [UInt8](totalAmount.utf8), until: 12, fillWith: "0", fillFront: true)                                         //총 금액
        dataArray += fillText(from: [UInt8](volunteer.utf8), until: 12, fillWith: "0", fillFront: true)        //봉사료
        dataArray += fillText(from: [UInt8](vatAmount.utf8), until: 12, fillWith: "0", fillFront: true)        //세금
        dataArray += fillText(from: [UInt8](proAmount.utf8), until: 12, fillWith: "0", fillFront: true)        //공급금액
        dataArray += fillText(from: [UInt8](taxFreeAmount.utf8), until: 12, fillWith: "0", fillFront: true)    //면세금액
        dataArray += fillText(from: [UInt8](workingKeyIndex.utf8), until: 2, fillFront: false)                //WorkingKeyIndex
        dataArray += fillText(from: [UInt8](password.utf8), until: 16, fillWith: "0", fillFront: false)        //비밀번호
        dataArray += fillText(from: [UInt8](baseApprovedNumber.utf8), until: 12, fillFront: false)            //원거래 승인번호
        dataArray += fillText(from: [UInt8](baseApprovedDate.utf8), until: 6, fillFront: false)                //원거래 승인일자
        dataArray += fillText(from: [UInt8](userInfo.utf8), until: 13, fillFront: false)                    //사용자 정보
        dataArray += fillText(from: [UInt8](storeId.utf8), until: 2, fillFront: false)                        //가맹점 ID
        dataArray += fillText(from: [UInt8](storeField.utf8), until: 30, fillFront: false)                    //가맹점 사용 필드
        dataArray += fillText(from: [UInt8](reserved.utf8), until: 4, fillFront: false)                        //Reserved
        dataArray += fillText(from: [UInt8](ksnetReserved.utf8), until: 20, fillFront: false)                //KSNET Reserved
        dataArray += [UInt8](dongleType.utf8)                                                                //동글 구분
        dataArray += [UInt8](mediaType.utf8)                                                                //매체 구분
        dataArray += [UInt8](telecomType.utf8)                                                                //이통사 구분
        dataArray += [UInt8](cardType.utf8)                                                                    //신용카드 종류
        dataArray += fillText(from: [UInt8](filler.utf8), until: 30, fillFront: false)                        //filter
        dataArray += fillText(from: [UInt8](dccData.utf8), until: 60, fillFront: false)                        //DCC
        dataArray += [UInt8](signFlag.utf8)                                                                    // 전자서명유무
        
        return makeEntirePacket(from: dataArray)
    }
    
    func makeEntirePacket(from dataArray:[UInt8]) -> Data {
        var packetBuffer:[UInt8] = []
        var paragramBytes:[UInt8] = []
        
        paragramBytes.append(0x02)
        if dataArray.count > 0 {
            paragramBytes += dataArray
        }
        paragramBytes.append(0x03)
        paragramBytes.append(0x0D)
        
        packetBuffer += [UInt8](String(format:"%04d", paragramBytes.count).utf8)
        packetBuffer += paragramBytes
        
//        requestTextView.text = SharedPaymentDataManager.shared.getEncodedEucKRString(from: packetBuffer)
        
        return Data(bytes: packetBuffer, count: packetBuffer.count)
    }
    
    func fillText(from byteArray:[UInt8], until length: Int,
                  fillWith fillString: String = " ", fillFront isAppendToFront: Bool = true) -> [UInt8] {
        var result: [UInt8] = []
        
        guard let fillByte = [UInt8](fillString.utf8).first else { return [] }
        
        var fillCharArray: [UInt8] = []
        
        for _ in 0..<(length - byteArray.count) {
            fillCharArray.append(fillByte)
        }
        
        if isAppendToFront {
            result += fillCharArray
            result += byteArray
        } else {
            result += byteArray
            result += fillCharArray
        }
        
        return result
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
