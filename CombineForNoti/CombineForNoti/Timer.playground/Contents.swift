import UIKit
import Combine


//let subscription = Timer.publish(every: 1.0, on: .main, in: .common)
//    .autoconnect()
//    .scan(0) { counter, _ in
//        counter + 1
//    }
//    .sink {
//        print($0)
//    }


// - Using DispatchQueue

let queue = DispatchQueue.main

let source = PassthroughSubject<Int, Never>()
var counter = 0

let cancellable = queue.schedule(after: queue.now, interval: .seconds(1)) {
    source.send(counter)
    counter += 1
}

let subscription = source.sink {
    print($0)
}
