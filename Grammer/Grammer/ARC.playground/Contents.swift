import UIKit

//class Person {
//    let name: String
//    init(name: String) {
//        self.name = name
//        print("\(name) 초기화 되었습니다.")
//    }
//    var apartment: Apartment?
//    deinit {
//        print("\(name) 초기화 해제되었습니다.")
//    }
//}



var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "너구리") // reference count = 1
// Prints "너구리 초기화 되었습니다."

reference2 = reference1  //reference count = 2
reference3 = reference1   //reference count = 3

reference1 = nil //reference count = 2
reference2 = nil //reference count = 1
reference3 = nil //reference count = 0
// Prints "너구리 초기화 해제되었습니다."


class Person {
    let name: String
    init(name: String) {
        self.name = name
    }
    var apartment: Apartment?
    deinit {
        print("\(name) 초기화 해제되었습니다.")
    }
}

class Apartment {
    let unit: String
        init(unit: String) { self.unit = unit }
        var tenant: Person?
        deinit { print("Apartment \(unit) 초기화 해제되었습니다.") }
}

var john: Person?
var unit4A: Apartment?

//MARK: Part1

john = Person(name: "John Appleseed") // Person reference count = 1
unit4A = Apartment(unit: "4A") // Apartment reference count = 1

//MARK: Part2
john!.apartment = unit4A // Apartment reference count = 2
unit4A!.tenant = john // Person reference count = 2


// MARK: Part3
john = nil // Person reference count = 1
unit4A = nil // Apartment reference count = 1

// 인스턴스 접근 불가 및 메모리 해제 불가
