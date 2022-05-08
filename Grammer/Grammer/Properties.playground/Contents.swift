import UIKit

// 타입 프로퍼티

class SomeClass {
    static var storedTypeProperty = "Some Value"
    static var computedTypeProperty: Int {
        return 27
    }
    static var overrideableComputedTypeProperty: Int {
        return 107
    }
}

SomeClass.storedTypeProperty // Some Value
SomeClass.storedTypeProperty = "Another Value"
SomeClass.storedTypeProperty // Another Value


struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                // store this as the new overall maximum input level
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 7
AudioChannel.maxInputLevelForAllChannels

rightChannel.currentLevel = 11
AudioChannel.maxInputLevelForAllChannels

//var y: Double = 1.1
//var x: Int = 7
//print(Int(x*y - 1))


func solution(_ w:Int, _ h:Int) -> Int64{
    var answer:Int64 = 0
    var inclination: Double = -(Double(h)/Double(w))
    for i in 1..<w {
        answer += Int64(getY(x: i, y: h, inclination: inclination))
    }
    return answer*2
}

func getY(x: Int, y: Int, inclination: Double) -> Int {
    return Int(floor(Double(x)*inclination + Double(y)))
}

solution(8, 12)
