import Foundation

let record = ["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"]

func solution(_ record:[String]) -> [String] {
    var answer: [String] = []
    var uidDic: [String: String] = [:]
    
    for i in record.filter({!$0.contains("Leave")}) {
        let arr = i.split(separator: " ").map { String($0) }
        uidDic[arr[1]] = arr[2]
    }
    
    for i in record {
        let newArr = i.split(separator: " ").map { String($0) }
        switch newArr[0] {
        case "Enter":
            answer.append("\(uidDic[newArr[1]] ?? "")님이 들어왔습니다.")
        case "Leave":
            answer.append("\(uidDic[newArr[1]] ?? "")님이 나갔습니다.")
        default:
            continue
        }
    }
    
    return answer
}

print(solution(record))
