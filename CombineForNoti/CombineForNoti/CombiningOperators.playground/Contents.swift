import UIKit
import Combine

// - prepend
// 데이터 앞에 새로운 데이터(퍼블리셔)를 추가 가능


let numbers = (1...5).publisher
let publisher2 = (2...5).publisher

numbers.prepend([10,11])
    .prepend(publisher2)
    .sink {
        print($0)
    }

// - append
// 데이터 뒤에 새로운 데이터(퍼블리셔)를 추가 가능

numbers.append([10,11])
    .append(publisher2)
    .sink {
        print($0)
    }

// switchToLast
// publisher가 publisher를 방출하는 상황에서 내부 publisher의 ouput을 출력하고
// 버퍼가 업기 때문에 가장 최근 publisher가 출력된다.

let publisher1 = PassthroughSubject<String, Never>()
let publisher22 = PassthroughSubject<String, Never>()

let publishers = PassthroughSubject<PassthroughSubject<String, Never>,Never>()


publishers.switchToLatest().sink {
    print($0)
}

publishers.send(publisher1)

publisher1.send("Publisher 1 - Value 1")
publisher1.send("Publisher 1 - Value 2")

publishers.send(publisher22)

publisher22.send("Publisher 2 - Value 1")

publisher1.send("Publisher 1 - Value 3")


// - combineLatest
// 두 publisher의 마지막 데이터를 결합하여 반환

let publisher111 = PassthroughSubject<Int, Never>()
let publisher222 = PassthroughSubject<String,Never>()

publisher111.combineLatest(publisher222)
    .sink {
        print("P1: \($0), P2: \($1)")
}

publisher111.send(1)
publisher222.send("A")
publisher222.send("B")


// - zip
// 두 pubisher가 짝이 되었을 때만 출력

publisher111.zip(publisher222)
    .sink {
        print("P1: \($0), P2: \($1)")
}

publisher111.send(1)
publisher222.send("A")
publisher222.send("B")
