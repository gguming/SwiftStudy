import UIKit
import Combine


let subscription = Timer.publish(every: 1.0, on: .main, in: .common)
    .autoconnect()
    .scan(0) { counter}
    .sink { _ in
        print("Timer Fired")
    }
