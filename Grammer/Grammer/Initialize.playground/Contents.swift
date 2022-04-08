import UIKit

// 인스턴스 생성

class SomeClass {
    init() {
        
    }
}

struct SomeStruct {
    init() {
        
    }
}

enum SomeEnum {
    case someCase
    
    init() {
        // 열거형은 초기화할 때 반드시 case중 하나가 되어야 함
        self = .someCase
    }
}

struct Fahrenheit {
    var temperature = 32.0
}
