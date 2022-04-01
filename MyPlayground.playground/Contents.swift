import UIKit
import Foundation

let numbers: [Int] = [1, 2, 3]

var sum: Int = numbers.reduce(0, { (result: Int, next: Int) -> Int in
    return result + next
})
print(sum)


let sumFromThree: Int = numbers.reduce(3) {
    $0 + $1
}

let names: [String] = ["1", "2", "3"]

let reduceName: String = names.reduce("숫자들 : ") {
    return $0 + ", " + $1
}


let subtractFromThree: Int = numbers.reduce(into: 3) {
    return $0 -= $1
}

var doubleNumbers: [Int] = numbers.reduce(into: [1, 2]) { (result: inout [Int], next: Int) in
    guard !result.contains(next) else { return }
    result.append(next*2)
}



var str = "neoguri"

str[str.index(str.startIndex, offsetBy: 3)]

str[str.index(after: str.startIndex)]
str[str.index(before: str.endIndex)]

str[str.index(str.startIndex, offsetBy: 3)...]

str.firstIndex(of: "n")


str.insert(" ", at: str.firstIndex(of: "e") ?? str.startIndex)


var str22 = "String Test"
if let range = str22.range(of: "String") {
    str22.replaceSubrange(range, with: "string")
}

if let range = str22.range(of: "Test") {
    let s = str22.replacingCharacters(in: range, with: "Test!!")
}

str22.replacingOccurrences(of: "Test", with: "testtt")
