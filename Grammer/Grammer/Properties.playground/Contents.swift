import UIKit

// 타입 프로퍼티

class SomeClass {
    static var storedTypeProperty = "Some Value"
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

SomeClass.storedTypeProperty = "Another Value"
SomeClass.storedTypeProperty


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

