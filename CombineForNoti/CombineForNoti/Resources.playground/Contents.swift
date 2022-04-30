import UIKit
import Combine

var subscription3: AnyCancellable? = nil

// 서로 공유가 안되어 있기 때문에 같은 값을 계속 불러와야 하는 문제가 있다.
// -> 문제를 해결하기 위해 share을 사용하면 된다.
guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
    fatalError("Invalid URL")
}

let subject = PassthroughSubject<Data, URLError>()


let request = URLSession.shared.dataTaskPublisher(for: url)
    .map(\.data)
    .print()
//    .share()
    .multicast(subject: subject)
    
let subscription = request.sink(receiveCompletion: { _ in}, receiveValue: {
    print("subscription 1")
    print($0)
})

let subscription2 = request.sink(receiveCompletion: { _ in}, receiveValue: {
    print("subscription 2")
    print($0)
})


//DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
    subscription3 = request.sink(receiveCompletion: {_ in}, receiveValue: {
        print("subscription 3")
        print($0)
    })
//}
request.connect()
subject.send(Data())
