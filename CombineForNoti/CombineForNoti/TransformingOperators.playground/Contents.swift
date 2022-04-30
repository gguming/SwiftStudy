import UIKit
import Combine


// collect
// 이벤트 한번에 모아서 배열로 출력
// collect() 안에 숫자 넣으면 해당 숫자만큼 slice해서 출력
["A", "B", "C", "D"].publisher
    .collect(3)
    .sink {
    print($0)
}

// - Map

let formatter = NumberFormatter()
formatter.numberStyle = .spellOut

[123,45,67].publisher
    .map {
        formatter.string(from: NSNumber(integerLiteral: $0))!
    }
    .sink {
        print($0)
    }

// Map KeyPath
// output에서 프로퍼티의 특정 키를 출력가능
struct Point {
    let x: Int
    let y: Int
}

let publisher = PassthroughSubject<Point, Never>()
publisher.map(\.x, \.y)
    .sink { x, y in
        print("\(x), \(y)")
    }
publisher.send(Point(x: 2, y: 10))


// - flatmap
// 뭔가 잘 이해 안된/...

struct School {
    let name: String
    let numOfStudents: CurrentValueSubject<Int, Never>
    
    init(name: String, numOfStudents: Int) {
        self.name = name
        self.numOfStudents = CurrentValueSubject(numOfStudents)
    }
}

let citySchool = School(name: "high School", numOfStudents: 100)
let school = CurrentValueSubject<School, Never>(citySchool)

//school.sink {
//    print($0)
//}

school
    .flatMap {
        $0.numOfStudents
    }
    .sink {
        print($0)
    }

let townSchool = School(name: "high town School", numOfStudents: 450)

school.value = townSchool

//citySchool.numOfStudents.value += 1



// - replaceNil
// nil인 값을 어떤 값으로 바꾸어줌
// 값은 Optional롤 출력

["A", "B", nil, "C"].publisher
    .replaceNil(with: "*")
    .sink {
        print($0)
    }

// = replaceEmpty
// Empty인 값을 어떤 값으로 바꾸어줌
let empty = Empty<Int, Never>()
empty
    .replaceEmpty(with: 1)
    .sink(receiveCompletion: {print($0)}, receiveValue: {print($0)})


// - scan
let publisher22 = (1...10).publisher
publisher22.scan([]) { numbers, value -> [Int] in
    return numbers + [value]
}
.sink {
    print($0)
}
