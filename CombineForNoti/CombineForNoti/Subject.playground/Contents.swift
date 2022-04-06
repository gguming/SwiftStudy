import UIKit
import Combine

// Subjects(두가지 기능을 모두 가지고 있다.)
//  - Publisher
//  - Subscriber

enum MyError: Error{
    case subscriberError
}

class StringSubscriber: Subscriber {
    func receive(subscription: Subscription) {
        subscription.request(.max(2))
    }
    
    func receive(_ input: String) -> Subscribers.Demand {
        print(input)
        return .max(1)
    }
    
    func receive(completion: Subscribers.Completion<MyError>) {
        print("completion")
    }
    
    typealias Input = String
    typealias Failure = MyError
    
}
let subscriber = StringSubscriber()
let subject = PassthroughSubject<String, MyError>()
subject.subscribe(subscriber)
let subscription = subject.sink { (completion) in
    print("Received Completion from sink")
} receiveValue: { value in
    print("Received Value from sink")
}

subject.send("A")
subject.send("B")
subscription.cancel()
subject.send("C")
