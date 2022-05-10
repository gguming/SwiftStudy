import UIKit

// 멀쩡한 사각형

func solution(_ w:Int, _ h:Int) -> Int64{
    var answer:Int64 = 0
    let inclination: Double = -(Double(h)/Double(w))
    for i in 1..<w {
        answer += Int64(getY(x: i, y: h, inclination: inclination))
    }
    return answer*2
}

func getY(x: Int, y: Int, inclination: Double) -> Int {
    return Int(floor(Double(x)*inclination + Double(y)))
}

