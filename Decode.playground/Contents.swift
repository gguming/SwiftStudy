import UIKit

let str = """
 {"code":"0000","msg":"성공하였습니다.","info":{"list":[{"merchant_cd":"MERB8697152BEDD11ECB41A0ABA17A696EA","image":"","auth_level":"S","company_nm":"테스트(삭제예정)"},{"merchant_cd":"MERA27A5ABABC8B11ECB41A0ABA17A696EA","branch_nm":"","image":"","auth_level":"S","company_nm":"테스트(삭제예정)"},{"merchant_cd":"MER0341466BBBB411ECB41A0ABA17A696EA","branch_nm":"2","image":"","auth_level":"S","company_nm":"시민 개시 탭 테스트"},{"merchant_cd":"MER7CB88624BBB211ECB41A0ABA17A696EA","branch_nm":"","image":"","auth_level":"S","company_nm":"테스트 입니다- 삭제예"},{"merchant_cd":"MER5C5F43E9BBB211ECB41A0ABA17A696EA","branch_nm":"","image":"","auth_level":"S","company_nm":"테스트 입니다- 삭제예"},{"merchant_cd":"MERFF8EB5C7BBB011ECB41A0ABA17A696EA","branch_nm":"","image":"","auth_level":"S","company_nm":"테스트 입니다- 삭제예"},{"merchant_cd":"MERAA16B903BBB011ECB41A0ABA17A696EA","branch_nm":"","image":"https://s3.ap-northeast-2.amazonaws.com/paymint.klick/merchant/MER00397424AC7D11EAB1900AA7A3B34888.jpeg","auth_level":"S","company_nm":"테스트(삭제예정)"},{"merchant_cd":"MER5EB88B7F34EA11E983070A8517547A00","branch_nm":"일산","image":"https://s3.ap-northeast-2.amazonaws.com/paymint.klick/merchant/MER5EB88B7F34EA11E983070A8517547A00.jpeg","auth_level":"M","company_nm":"윤학원"}]}}
"""

let str2 = """
 {"code":"0000","msg":"성공하였습니다.","info":{"list":[{"merchant_cd":"MER2E2A6298740811ECA67D0AEBD070D778","branch_nm":"2022-01-13 두번째","image":"","auth_level":"S","company_nm":"웰컴메일 테스트"},{"merchant_cd":"MERDBD4257D740611ECA67D0AEBD070D778","branch_nm":"2022-01-13","image":"","auth_level":"S","company_nm":"배너 테스트"},{"merchant_cd":"MER438E9C22175211ECA67D0AEBD070D778","branch_nm":"매장이 있는 경우 테스트","image":"","auth_level":"S","company_nm":"개인 신규"},{"merchant_cd":"MER892AED5D175111ECA67D0AEBD070D778","branch_nm":"테스트","image":"","auth_level":"S","company_nm":"매장이 없는 경우"},{"merchant_cd":"MER547786C9069211ECA67D0AEBD070D778","branch_nm":"사업장 등록 테스트","image":"","auth_level":"S","company_nm":"법인 카드 가맹 2"},{"merchant_cd":"MER4AB583D8069211ECA67D0AEBD070D778","branch_nm":"사업장 등록 테스트","image":"","auth_level":"S","company_nm":"개인 카드 가맹 2"},{"merchant_cd":"MER3FC3D7C8069211ECA67D0AEBD070D778","branch_nm":"사업장 등록 테스트","image":"","auth_level":"S","company_nm":"개인 카드 신규 2 "},{"merchant_cd":"MER2E505B0A069111ECA67D0AEBD070D778","branch_nm":"사업장 등록 테스트입니다","image":"","auth_level":"S","company_nm":"법인 카드 신규"},{"merchant_cd":"MER584FAF60068D11ECA67D0AEBD070D778","branch_nm":"사업장 등록 테스트입니다","image":"","auth_level":"S","company_nm":"법인 카드 가맹"},{"merchant_cd":"MER1F6A359E068D11ECA67D0AEBD070D778","branch_nm":"","image":"","auth_level":"S","company_nm":"개인 카드 가맹"},{"merchant_cd":"MER3AB9521A068A11ECA67D0AEBD070D778","branch_nm":"가맹점 등록 테스트","image":"","auth_level":"S","company_nm":"테스트"},{"merchant_cd":"MER5EB88B7F34EA11E983070A8517547A00","branch_nm":"일산","image":"https://s3.ap-northeast-2.amazonaws.com/paymint.klick/merchant/MER5EB88B7F34EA11E983070A8517547A00.jpeg","auth_level":"S","company_nm":"윤학원"}]}}
"""

let str3 = """
{"code":"b"}
"""


guard let data = str.data(using: .utf8),
      let jsondata = try? JSONDecoder().decode(ResStoresInfo.self, from: data) else { fatalError() }
print(data)
print(jsondata)





struct ResStoresInfo : Codable {
    var code: String = ""
    
    var msg: String = ""
    
    var info:StoresInfo?
//    var info:VersionInfo?
}

struct StoresInfo : Codable {
    var list : [StoreInfo]?
}

struct StoreInfo : Codable, Hashable{
    var company_nm = ""
    // 지점명
    var branch_nm: String? = ""
    // 지점 코드
    var merchant_cd = ""
    // 지점 이미지
    var image = ""
}

