import UIKit


let neoguri = "neoguri"
let neguriWithMap = neoguri.map { cha in
    return cha
}

var charArr: [Character] = []
for cha in neoguri {
    charArr.append(cha)
}

print(neoguri)
print(neguriWithMap)
print(charArr)


// MARK: filter

let numberList = [1,2,3,4,5,6,7,8]
let evenNumberList = numberList.filter { $0%2 == 0 }
// [2,4,6,8]


print(evenNumberList)


// MARK: reduce

// 첫번째 메소드 사용
[1,2,3,4,5].reduce(0) { result, next in
    return result + next
}


// 두번째 메소드 사용
[1,2,3,4,5].reduce(into: 0) { result, next in
    return result += next
}
