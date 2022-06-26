import UIKit


let neoguri = "neoguri"
let neguriWithMap = neoguri.map { cha in
    return cha
}

var charArr: [Character] = []
for cha in neoguri {
    charArr.append(cha)
}

//print(neoguri)
//print(neguriWithMap)
//print(charArr)


// MARK: filter

let numberList = [1,2,3,4,5,6,7,8]
let evenNumberList = numberList.filter { $0%2 == 0 }
// [2,4,6,8]


//print(evenNumberList)


// MARK: reduce

// 첫번째 메소드 사용
[1,2,3,4,5].reduce(0) { result, next in
    return result + next
}


// 두번째 메소드 사용
[1,2,3,4,5].reduce(into: 0) { result, next in
    return result += next
}



[1,2,3,4,5].flatMap { $0 + 2 }

let arr: [[Int]] = [[1], [23, 4], [1,2,3]]

let arrWithFlatMap = arr.flatMap { $0 }
//print(arrWithFlatMap)


let flatMapTestArr = [1,2,3,4,5].compactMap{ $0 }


let intArrWithNil: [Int?] = [1,2,nil,5,6,nil]
//print(intArrWithNil)
//print(intArrWithNil.compactMap{ $0 })


let testArr: [[Int?]] = [[1, nil], [23, 4], [nil,1,2,3]]
print(testArr.flatMap {$0})
print(testArr.compactMap {$0})
