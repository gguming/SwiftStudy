//
//  main.swift
//  Alg
//
//  Created by 장희선 on 2022/02/24.
//

import Foundation
// MARK: 1008
//let input = readLine()!.components(separatedBy: " ").map{ Double($0)!}
//print(input[0]/input[1])

//MARK: 1330

//let input = readLine()!.components(separatedBy: " ").map{ Int($0)!}
//
//if input[0] > input[1] {
//    print(">")
//} else if input[0] < input[1] {
//    print("<")
//} else {
//    print("==")
//}

//MARK: 2753
//
//let input = Int(readLine()!)!
//
//if (input%4 == 0) && (input%400 == 0 || input%100 != 0) {
//    print(1)
//} else {
//    print(0)
//}


//MARK: 9498
//let input = Int(readLine()!)!
//
//switch input {
//case 90...100:
//    print("A")
//case 80...89:
//    print("B")
//case 70...79:
//    print("C")
//case 60...69:
//    print("D")
//default:
//    print("F")
//}

//MARK: 2438

//let num = Int(readLine()!)!
//
//for i in 1...num {
//   for x in 1...i {
//       print("*",terminator: "")
//   }
//    print("")
//}

//MARK: 2439
//let number = Int(readLine()!)!
//
//for i in 1...number{
//    let space = [Character].init(repeating: " ", count: number-i)
//    let char = [Character].init(repeating: "*", count: i)
//
//    print(String(space+char))
//}

//MARK: 2739
//import Foundation
//
//let num: Int = Int(readLine()!)!
//for var multi in 1...9 {
//    print("\(num) * \(multi) = \(num * multi)")
//}

//MARK: 2741
//import Foundation
//
//let num = Int(readLine()!)!
//for var pNum in 1...num {
//    print(pNum)
//}

//MARK: 2742
//let input = Int(readLine()!)!
//for i in 0 ..< input {
//    print(input - i)
//}

//MARK: 2884
//let time = readLine()!
//
//let timeArr = time.split(separator: " ")
//
//var hour = Int(timeArr[0])!
//var min = Int(timeArr[1])!
//min -= 45
//if min < 0 {
//  hour -= 1
//  min += 60
//}
//
//if hour < 0 {
//  hour += 24
//}
//
//print("\(hour) \(min)")

//MARK: 10818
//let n: Int = Int(readLine()!)!
//let numbers: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
//print(numbers.min()!, numbers.max()!)



//MARK: 2752
//let input = readLine()!.components(separatedBy: " ").map{Int($0)!}
//let arr = input.sorted(by: {$0 < $1})
//print("\(arr[0]) \(arr[1]) \(arr[2])")


//MARK: 2959
//let input = readLine()!.components(separatedBy: " ").map{Int($0)!}
//let arr = input.sorted(by: {$0 < $1})
//print(arr[0]*arr[2])

//MARK: 13771
let input = Double(readLine()!)!
print(input)
