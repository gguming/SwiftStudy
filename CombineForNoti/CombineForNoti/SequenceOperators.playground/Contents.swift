import UIKit
import Combine

// Sequence로 이루어진 output을 처리하는 operator

// - min, max
// publisher가 finish될때까지 기다린 다음 이후 연산
// 데이터 중 max(min)값을 출력

[1,3,100].publisher
    .max()
    .sink {
        print($0)
    }

[1,3,100].publisher
    .min()
    .sink {
        print($0)
    }


// first, last
// 첫번째나 마지막 데이터를 방출
// first는 조건을 만족하면 바로 방출되고, last는 finish후 출력

let publisher = ["A","B","C","D"].publisher

publisher.first().sink {
    print($0)
}

publisher.first(where: { "Cat".contains($0) }).sink {
    print($0)
}

print("Last Publisher")

publisher.last().sink {
    print($0)
}
