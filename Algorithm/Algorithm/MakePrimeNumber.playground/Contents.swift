import UIKit

func solution(_ nums:[Int]) -> Int {
    var answer = 0
    let secondNums = nums[1...]
    let thirdNums = nums[2...]
    for i in nums {
        for j in secondNums {
            for k in thirdNums{
                if checkNums(num1: i, num2: j, num3: k) { answer += 1}
            }
        }
    }
    
    return answer
}


func checkNums(num1: Int, num2: Int, num3: Int) -> Bool {
    let total = num1 + num2 + num3
    for i in 2...total/2 {
        if total.isMultiple(of: i) {
            return false
        }
    }
    return true
}
