import UIKit


func solution(_ s:String) -> Int{
    var checkArr: [Character] = []
    let arr = Array(s)
    
    for i in arr.indices {
        if checkArr.isEmpty { checkArr.append(arr[i]) }
        else {
            if checkArr.last! == arr[i] { checkArr.removeLast() }
            else { checkArr.append(arr[i]) }
        }
    }
    
    return checkArr.isEmpty ? 1 : 0
}

solution("baabaa")
