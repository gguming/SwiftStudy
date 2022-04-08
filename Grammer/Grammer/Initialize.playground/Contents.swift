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

// 초기화시 파라미터가 다른 경우
//struct Celsius {
//    var temperatureInCelsius: Double
//
//    init(fromFahrenheit fahrenheit: Double) {
//        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
//    }
//    init(fromKelvin kelvin: Double) {
//        temperatureInCelsius = kelvin - 273.15
//    }
//}

class Person {
    var name: String
    
    init(koreanName: String) {
        name = koreanName
    }
    init(englishName: String) {
        name = englishName
    }
}

var neoguriInKorea = Person(koreanName: "너구리")
print(neoguriInKorea.name)
var neoguriInEnglish = Person(englishName: "neoguri")
print(neoguriInEnglish.name)

// 옵셔널 타입은 초기화 안해도 됩니다.

class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
// 프로퍼티가 상수(let)으로 선언되어 있엇도 초기화는 가능하다.
let neoguriQuestion = SurveyQuestion(text: "이름이 뭐야?")
neoguriQuestion.ask()
neoguriQuestion.response = "너구리"


// 실패 가능한 이니셜라이저
// 이니셜라이저를 통해 초기화할 수 없는 예외 상황이 발생할 수 있음(클래스, 구조체, 열거형)
// 이상한 값을 전달하거나
// 이런 것들을 염두하여 옵셔널을 사용하여 init을 사용하는데 이것을 실패 가능한 이니셜라이져
// 실패가능한 이니셜라이저와 정상적인 이니셜라이저는 같은 매개변수 이름과 타입을 가질 수 없다
// 실패 가능한 이니셜라이저는 특히 열거형에서 유용하게 사용가능하다
// 특정 case에 맞지 않는 값이 들어오거나 rawValue에 잘못된 값이 들어오면 실패 가능한 이니셜라아저로 대응가능

class Person2 {
    let name: String
    var age: Int?
    
    init?(name: String) {
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
    
    init?(name: String, age: Int) {
        if name.isEmpty || age < 0 {
            return nil
        }
        self.name = name
        self.age = age
    }
}

let neoguri: Person2? = Person2(name: "neoguri", age: 99)
if let person = neoguri {
    print(person.name)
}


// 함수를 이용한 프로퍼티 기본값 설정
// 저장 프로퍼티의 기본값을 연산을 통해 설정하고자 하면 클로저나 함수를 사용하여 설정할 수 있다.
// 주의해아할점 : 클로저 사용시 초기화할 때 다른 프로퍼티 값이 설정되기 전이기 때문에 연산을 할 수 없다.
// 기본값이 있더라도 안돼, self, 인스턴스 메서드도 사용안돼
// 클로저 뒤에 소괄호를 붙이는 이유는 클로저를 실행하기 위해서 사용/ 소괄호가 없다면 기본값은 클로저 살행값이 아닌 클로저 그 자체이다.
class LabelClass{
    var label: UILabel = {
        let label = UILabel()
        label.text = "neoguri"
        return label
    }()
}

// 디이니셜라이저 클래스에서만 구현 가능
// 메모리에서 해체되기 전에 실행되며 원하는 정리 작업 구현 가능

class TestClass {
    deinit {
        print("디이니셜라이저")
    }
}

var test: TestClass? = TestClass()
test = nil
