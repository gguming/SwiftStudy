import UIKit
import Combine


guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
    fatalError("Invalid URL")
}

let request = URLSession.shared.dataTaskPublisher(for: url)
let subscription = request
//    .print() // 무슨일이 일어난지 알 수 없지만 cancel 된것은 알 수 있다.
    .handleEvents(receiveSubscription: { _ in print("Subscription Received")}, receiveOutput: { _,_ in print("Received Output")}, receiveCompletion: { _ in print("Received completion")}, receiveCancel: { print("Received cancel")}, receiveRequest: { _ in print("Received Request")})
    .sink(receiveCompletion: { print($0)}, receiveValue: { data, response in
    print(data)
})

