import UIKit
import Combine

// - filter
// 어떤 값을 걸러낼 떄 사용
// 조건에 따라 필터링 -> Bool
let numbers = (1...20).publisher
numbers.filter { $0 % 2 == 0 }
    .sink {
        print($0)
    }


// removeDuplicates
// 최근 버퍼만 검사하기 때문에 근접한 중복만 제거
let words = "1 1 1 2 2 3 1 3 4".components(separatedBy: " ").publisher
words
    .removeDuplicates()
    .sink {
        print($0)
    }

// - compactMap
// nil이 아닌 값을 옵셔널로 출력

let strings = ["a", "1.24", "b", "3.45"].publisher
    .compactMap { Float($0) }
    .sink {
        print($0)
    }


// - ignoreOutput
// output을 무시하고 completion만 출력
let num = (1...3).publisher
    .ignoreOutput()
    .sink(receiveCompletion: {print($0)}, receiveValue: {print($0)})


// - first, last
// 조건에 맞는 첫번째(마지막) 데이터만 반환하고 completion 출력

let nums = (1...9).publisher

nums.first(where: { $0 % 2 == 0 })
    .sink {
        print($0)
    }
nums.last(where: { $0 % 2 == 0 })
    .sink {
        print($0)
    }


// - dropFirst
// 파라미터로 들어간 index의 데이터부터 반환

nums.dropFirst(8)
    .sink {
        print($0)
    }


// - dropWhile
// 조건식이 맞는 최초의 인덱스부터 데이터 출력
nums.drop(while: { $0 % 5 == 0 })
    .sink {
        print($0)
    }

// - drop untilOutputFrom
// 주어진 파라미터의 output이 발생할 때 부터 데이터 출력

let isReady = PassthroughSubject<Void, Never>()
let taps = PassthroughSubject<Int, Never>()

taps.drop(untilOutputFrom: isReady)
    .sink {
    print($0)
}

(1...10).forEach { num in
    taps.send(num)
    
    if num % 5 == 0 {
        isReady.send()
    }
}


// - prefix
// 파라마터로 들어간 인덱스나 주어진 조건식이 만족할 떄 까지 데이터 출력

nums.prefix(3)
    .sink {
        print($0)
    }

nums.prefix(while: {$0 < 4})
    .sink {
        print($0)
    }
