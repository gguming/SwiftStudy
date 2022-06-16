import UIKit


protocol FirstProtocol {
    
}

protocol AnotherProtocol {
    
}

class SomeSuperClass {
    
}


class SomeClass: SomeSuperClass, FirstProtocol, AnotherProtocol {
    
}

// 프로토콜 선언
protocol FullNamed {
    var fullName: String { get }
}

// 프로토콜 채택
struct Person1: FullNamed {
    var name: String
    // 프로토콜 준수
    var fullName: String
}
// 프로토콜 채택
//struct Person2: FullNamed {
//
//}
//
//var neoguri = Person1(fullName: "neoguri")
//neoguri.fullName = "너구리"
//

protocol Age {
    var currentAge: Int { get }
}

struct Person2: Age {
    var name: String
    var age: Int
    // 상수 저장 프로퍼티 선언
    let currentAge: Int
}

struct Person3: Age {
    var name: String
    var age: Int
    // 변수 저장 프로퍼티 선언
    var currentAge: Int
}

struct Person4: Age {
    var name: String
    var age: Int
    // 연산 프로퍼티
    var currentAge: Int {
            return age
    }
}

struct Person5: Age {
    var name: String
    var age: Int
    // 연산 프로퍼티
    var currentAge: Int {
        get {
            return age
        }
        set(newAge) {
            age = newAge
        }
    }
}



var neoguri22 = Person5(name: "너구리", age: 7)
neoguri22.currentAge
neoguri22.currentAge = 20
// neoguri22.age : 20



protocol SomeProtocol {
    func nextInteger(num1: Int, num2: Int) -> Int
}


func nextInteger(num1: Int = 1, num2: Int) -> Int {
    return num1 + num2
}

protocol RectangleArea {
    func getArea() -> Int
}


struct Rectangle: RectangleArea {
    var width: Int
    var height: Int
    func getArea() -> Int {
        return width*height
    }
}

let rectangle1 = Rectangle(width: 10, height: 10)
print(rectangle1.getArea()) // 100


protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}
var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()
// lightSwitch .on


protocol SomeProtocol2 {
    init(somePrameter: Int)
}

class SomeClass2: SomeProtocol2 {
    required init(somePrameter: Int) {
        
    }
}

protocol SomeProtocol3 {
    init()
}


class SuperClass {
    init() {}
}

class SubClass: SuperClass, SomeProtocol3 {
    required override init() {
        <#code#>
    }
}


// 주사위 랜덤 번호 생성 프로토콜
protocol RandomNumberGenerator {
    func random() -> Double
}

// 프로토콜 상속
class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    // 프로토콜 준수
    func random() -> Double {
        lastRandom = ((lastRandom * a + c)
            .truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}
// 인스턴스 생성
let generator = LinearCongruentialGenerator()

// 클래스 정의
class Dice {
    let sides: Int
    // 프로토콜 타입으로 사용
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
for _ in 1...5 {
    print("Random dice roll is \(d6.roll())")
}
// Random dice roll is 3
// Random dice roll is 5
// Random dice roll is 4
// Random dice roll is 5
// Random dice roll is 4
