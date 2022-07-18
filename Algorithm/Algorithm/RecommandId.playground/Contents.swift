import UIKit

func solution(_ new_id:String) -> String {
    var stringArr: [String] = []
    
    stringArr = new_id.map { $0.lowercased() }
    
    var newString = stringArr.filter {
        return Character($0).isLetter || Character($0).isNumber || Character($0) == "-" || Character($0) == "_" || Character($0) == "."
    }.joined()
    
    while newString.contains("..") {
        newString = newString.replacingOccurrences(of: "..", with: ".")
    }
    var newArr3: [String] = newString.map { String($0) }
    
    
    if newArr3.first == "." {
        newArr3.removeFirst()
    }
    
    if newArr3.last == "." {
        newArr3.removeLast()
    }
    
    if newArr3.count == 0 {
        newArr3.append("a")
    }
    
    if newArr3.count > 15 {
        let count = newArr3.count
        newArr3.removeLast(count - 15)
        
        if newArr3.last == "." {
            newArr3.removeLast()
        }
    }
    
    if newArr3.count < 3 {
        let last = newArr3.last!
        while newArr3.count < 3 {
            newArr3.append(last)
        }
    }
    
    return newArr3.joined()
    
}


solution("123_.def")
