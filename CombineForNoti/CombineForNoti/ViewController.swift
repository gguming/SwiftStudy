//
//  ViewController.swift
//  CombineForNoti
//
//  Created by 장희선 on 2022/04/05.
//

import UIKit
import Combine

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let notification = Notification.Name("MyNoti")
//
//        let publisher = NotificationCenter.default.publisher(for: notification, object: nil)
//        let subscription = publisher.sink { _ in
//            print("notification received")
//        }
//
//
//        NotificationCenter.default.post(name: notification, object: nil)
//        subscription.cancel()
        
        let publisher = ["a", "b", "c", "d", "e"].publisher
        let subscriber = StringSubscriber()
        publisher.subscribe(subscriber)
        
    }

}

class StringSubscriber: Subscriber {
    func receive(subscription: Subscription) {
        print("Received Subscription")
        subscription.request(.max(3)) // backpressure
    }
    
    func receive(_ input: String) -> Subscribers.Demand {
        print("Received Value", input)
        return .unlimited
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        print("Completed")
    }
    

    typealias Input = String
    typealias Failure = Never
    
    
}
