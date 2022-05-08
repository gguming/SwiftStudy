import UIKit

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    var num1 = queue1.reduce(0, +)
    var num2 = queue2.reduce(0, +)
    var arr1 = queue1
    var arr2 = queue2
    var count: Int = 0
    if checkValid(queue1, queue2) || (num1 + num2)%2 != 0 {
        return -1
    } else {
        while num1 != num2{
            if num1 > num2 {
                let num = arr1.first
                arr1.dropFirst()
                arr2.append(num!)
                num1 -= num!
                num2 += num!
                count += 1
            } else {
                let num = arr2.first
                arr2.dropFirst()
                arr1.append(num!)
                num2 -= num!
                num1 += num!
                count += 1
            }
        }
        return count
    }
    
}

func checkValid(_ arr1: [Int], _ arr2: [Int]) -> Bool {
    let arr = arr1 + arr2
    let max = arr.max()
    return (arr.reduce(0, +) - max!) < max!
}

func chekcValid2(_ arr1: [Int], _ arr2: [Int]) -> Bool {
    let arr = arr1 + arr2
    let arrSum = arr.reduce(0, +)/2
    var bool = false
    for i in 1..<arr.count {
        for array in combi(elements: arr, k: i) {
            if array.reduce(0, +) == Int(arrSum) {
                bool = true
                break
            }
        }
        if bool { break }
    }
    return bool
}

func sum(_ arr: [Int]) -> Int {
    var num = 0
    for i in arr {
        num += i
    }
    return num
}

solution([3, 2, 7, 2],     [4, 6, 5, 1])



func combination<T>(elements: ArraySlice<T>, k: Int) -> [[T]] {
    guard let first = elements.first else { return [] }
    
    let head = [first]
    let subCombi = combination(elements: elements, k: k-1)
    var ret = subCombi.map {head + $0}
    ret += combination(elements: elements.dropFirst(), k: k)
    return ret
}

func combi<T>(elements: Array<T>, k:Int) -> [[T]] {
    return combination(elements: ArraySlice(elements), k: k)
}

