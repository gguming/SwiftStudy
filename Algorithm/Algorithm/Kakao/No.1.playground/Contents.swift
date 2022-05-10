import UIKit
import Foundation


func solution(_ survey:[String], _ choices:[Int]) -> String {
    var dic: [Character: Int] = ["R": 0, "T": 0, "C": 0, "F": 0, "J": 0, "M": 0, "A":0, "N": 0]
    let checkCha: [[Character]] = [["R", "T"], ["C", "F"], ["J", "M"], ["A", "N"]]
    var answer = ""
    for i in 0..<survey.count {
        switch choices[i] {
        case 1...3:
            dic[survey[i].first!]! += 4 - choices[i]
        case 5...7:
            dic[survey[i].last!]! += choices[i] - 4
        default:
            continue
        }
    }
    for index in 0..<checkCha.count {
        if dic[checkCha[index][0]]! > dic[checkCha[index][1]]! {
            answer += String(checkCha[index][0])
        } else if dic[checkCha[index][0]]! < dic[checkCha[index][1]]! {
            answer += String(checkCha[index][1])
        } else {
            answer += checkCha[index][0] < checkCha[index][1] ? String(checkCha[index][0]) : String(checkCha[index][1])
        }
    }
    return answer
}

solution(["AN", "CF", "MJ", "RT", "NA"]    , [5, 3, 2, 7, 5])

