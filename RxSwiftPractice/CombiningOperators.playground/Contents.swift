import RxSwift
import Foundation

let disposeBag = DisposeBag()

print("------startWith----------")
// 초기값을 넣을 때 사용

let yellowClass = Observable<String>.of("1", "2", "3")

yellowClass
    .enumerated()
    .map({ index, element in
        return element + "어린이" + "\(index)"
    })
    .startWith("teacher")
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)


print("------concat1----------")
// concat의 배열 순서 대로 출력
let yellowClassMember = Observable<String>.of("1", "2", "3", "4")

let teacher = Observable<String>.of("teacher")

let walk = Observable
    .concat([teacher, yellowClassMember])

walk
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)


print("------concat2----------")

teacher
    .concat(yellowClassMember)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)


print("------concatMap----------") // flatMap

// 각각의 시퀀스가 다음의 구독이 일어나기 전에 함쳐지게 한다.

let child: [String: Observable<String>] = [
    "노랑반": Observable.of("1", "2", "3"),
    "파랑반": Observable.of("4", "5", "6")
]

Observable.of("노랑반", "파랑반")
    .concatMap{ cla in
        child[cla] ?? .empty()
    }
    .subscribe(onNext:{
        print($0)
    })
    .disposed(by: disposeBag)


print("-------merge1----------")
// 순서를 보장하지 않고 합침
let norRiver = Observable.from(["강북구","성북구", "동대문구", "종로구"])
let souRiver = Observable.from(["강남구","강동구", "영등포구", "양천구"])

// 위의 두 배열은 연관이 없지만 에러가 어느 한 곳이라도 있을 경우 merge후 에러를 방출한다.

Observable.of(norRiver, souRiver)
    .merge()
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("-------merge2----------")
// maxConcurrent를 이용하면 처리할 수 있는 sequence를 제한할 수 있고
// 1을 주었으므로 norRiver의 이벤트 처리후 souRiver 이벤트를 받는다.
Observable.of(norRiver, souRiver)
    .merge(maxConcurrent: 1)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)


print("-------combineLatest1----------")
// 값을 방출할 때 마다 클로저를 통해 최신값을 출력
// 여러 텍스트 필드를 관찰하고 데이터를 결합할 때 자주 사용
let lastName = PublishSubject<String>()
let firstName = PublishSubject<String>()

let name = Observable
    .combineLatest(lastName, firstName) { lastName, firstName in
        lastName + firstName
    }

name
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)


lastName.onNext("김")
firstName.onNext("라면")
firstName.onNext("명수")
firstName.onNext("로수")
lastName.onNext("이")
lastName.onNext("박")
lastName.onNext("최")


print("-------combineLatest2----------")

let dateForm = Observable<DateFormatter.Style>.of(.short, .long)
let currentDate = Observable<Date>.of(Date())

let currentDateForm = Observable
    .combineLatest(
        dateForm,
        currentDate) { form, date -> String in
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = form
            return dateFormatter.string(from: date)
        }


currentDateForm
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)


print("-------combineLatest3----------")


let lastName22 = PublishSubject<String>()
let firstName22 = PublishSubject<String>()

let fullName = Observable
    .combineLatest([firstName22, lastName22]) { name in
        name.joined(separator: " ")
    }

fullName
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

lastName22.onNext("Kim")
firstName22.onNext("paul")

firstName22.onNext("laul")
firstName22.onNext("dff")
firstName22.onNext("paul")


print("-------zip----------")
// 서로 쌍이 맞아야 출력 가능
enum Rresult {
    case win
    case def
}

let fight = Observable<Rresult>.of(.win, .def, .def, .win, .win)
let player = Observable<String>.of("한국", "대만", "미국", "일본", "영국", "프랑스")

let result = Observable
    .zip(fight, player) { res, pla in
        return pla + "선수" + "\(res)"
        
    }

result
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)


print("-------withLatestFrom1----------")
// 트리거 역할
// 트리거 실행 후 가장 최신의 값이 출력됨
let trigger = PublishSubject<Void>()
let runner = PublishSubject<String>()

trigger
    .withLatestFrom(runner)
// sample과 같은 역할을 수행
//    .distinctUntilChanged()
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

runner.onNext("1")
runner.onNext("1, 2")
runner.onNext("1, 2, 3")

trigger.onNext(Void())
trigger.onNext(Void())


print("-------sample----------")
// 한번만 출력함
let start = PublishSubject<Void>()
let f1 = PublishSubject<String>()

f1
    .sample(start)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

f1.onNext("1")
f1.onNext("1, 2")
f1.onNext("1, 2, 3")

start.onNext(Void())
start.onNext(Void())


print("-------amb----------")
// 먼저 방출하는 시퀀스가 생기면 나머지는 방출하지 않는다
let bus1 = PublishSubject<String>()
let bus2 = PublishSubject<String>()

let busStop = bus1.amb(bus2)

busStop
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

bus2.onNext("버스2 승객0 : 1")

bus1.onNext("버스1 승객0 : 3")
bus2.onNext("버스2 승객1 : 1")
bus2.onNext("버스2 승객2 : 1")
bus1.onNext("버스1 승객1 : 4")
bus2.onNext("버스2 승객3 : 1")


print("-------switchLatest----------")
// 소스 옵저버블(shake)에 마지막으로 들어온 시퀀스 아이템만 방출
let student1 = PublishSubject<String>()
let student2 = PublishSubject<String>()
let student3 = PublishSubject<String>()

let shake = PublishSubject<Observable<String>>()

let claofshake = shake.switchLatest()

claofshake
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

shake.onNext(student1)
student1.onNext("학생1 : 저는 1번 학생입니다.")
student2.onNext("학생2 : 저ㅇ요 저요!")


shake.onNext(student2)
student2.onNext("학생2 : 저는 2번 학생입니다.")
student1.onNext("학생1 : 아직 할 말 있는데...!")


shake.onNext(student3)
student2.onNext("학생2 : 아니 잠깐만 내가!")
student1.onNext("학생1 : 언제 말할 수 있죠?")
student3.onNext("학생3 : 저는 3번입니다!! ")


shake.onNext(student1)
student1.onNext("학생1 : 승자")
student2.onNext("학생2 : ㅠㅠ")
student3.onNext("학생3 : 이긴줄 알았는데! ")
student2.onNext("학생2 : ㅠㅠ")


print("-------reduce----------")

// 시퀀스 아이템끼리 결합
// 결과값만 방출
Observable.from((1...10))
//    .reduce(0, accumulator: { summary, newValue in
//        return summary + newValue
//    })
//    .reduce(0, accumulator: { summary, newValue in
//        return summary + newValue
//    })
    .reduce(0, accumulator: +)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)


print("-------scan----------")
// 변화 과정의 값까지 같이 방출
Observable.from((1...10))
    .scan(0, accumulator: +)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)
