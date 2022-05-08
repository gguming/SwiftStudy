import UIKit


func solution(_ alp:Int, _ cop:Int, _ problems:[[Int]]) -> Int {
    var alp1 = alp
    var cop1 = cop
    var checkArr: [Bool] =  Array(repeating: false, count: problems.count)
    var count = 0
    while checkArr.contains(false) {
        var indexForChoice = 0
        var numForChoice = 0
        for (index, array) in problems.enumerated() {
            if checkProblem(alp1: alp1, cop1: cop1, num1: array[0], num2: array[1]) < numForChoice {
                indexForChoice = index
                numForChoice = checkProblem(alp1: alp1, cop1: cop1, num1: array[0], num2: array[1])
            }
        }
    }
    return 0
}

func checkProblem(alp1: Int, cop1: Int, num1: Int, num2: Int) -> Int {
    var count = 0
    if alp1 > num1 {
        count += alp1 - num1
    }
    if cop1 > num2 {
        count += cop1 - num2
    }
    return count
}
