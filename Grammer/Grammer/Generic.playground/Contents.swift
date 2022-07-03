import UIKit

var a = 7
var b = 8

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

swapTwoInts(&a, &b) // a = 8, b = 7
//print(a)
//print(b)



var c = 7
var d = "10"

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

//swapTwoValues(&c, &d)


func swapTwoAny(_ a: inout Any, _ b: inout Any) {
    let temporaryA: Any = a
    a = b
    b = temporaryA
}
//swapTwoAny(&c, &d) // c = "10", d = 7



struct Stack<Element> {
    var items: [Element] = []
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var intStack = Stack<Int>()
var stringStack = Stack<String>()

intStack.push(7)
intStack.push(7)
intStack.push(7)
print(intStack)

stringStack.push("너구리")
stringStack.push("라면")
print(stringStack)


extension Stack {
    var topElement: Element? {
        return self.items.last
    }
}

stringStack.topElement // 라면


func plus<T: BinaryInteger>(a: T, b: T) -> T {
    return a + b
}

print(plus(a: 7, b: 8)) // 15
