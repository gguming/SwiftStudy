import RxSwift

let disposeBag = DisposeBag()
print("---------ignoreElements-----------")

// complete나 error같은 정지 이벤트는 허용하지만 onNext는 허용하지 않음
let sleepMode = PublishSubject<String>()

sleepMode
    .ignoreElements()
    .subscribe{ _ in
        print("기상")
    }
    .disposed(by: disposeBag)

sleepMode.onNext("기상11")
sleepMode.onNext("기상11")

sleepMode.onNext("기상11")
sleepMode.onCompleted()

print("---------elementAt-----------")

let twice = PublishSubject<String>()

twice
    .element(at: 2)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

twice.onNext("깨우기")         // index0
twice.onNext("깨우기")         // index1
twice.onNext("깨우기 index")   // index2
twice.onNext("깨우기")         // index4

print("------filter---------")

// ignoreElements 나 elementAt은 observable의 요소를 필터링 해서 방출
// filter는 요구사항이 한 가지 이상일 때 사용한다.

Observable.of(1,2,3,4,5,6,7,8)
    .filter {$0 % 2 == 0}
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag )



print("------skip---------")
// skip한 요소 이후부터 방출

Observable.of("1", "2", "3", "4", "5", "6")
    .skip(5)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)


print("------skipWhile---------")

// 해당 조건이 false인 순간부터 방출
Observable.of("1", "2", "3", "4", "5", "6", "7")
    .skip(while: {
        $0 != "4"
    })
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)


print("------skipUntil---------")

let guset = PublishSubject<String>()
let openTime = PublishSubject<String>()

guset
    .skip(until: openTime)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

guset.onNext("gkdl1")
guset.onNext("gkdl2")

openTime.onNext("now")

guset.onNext("chleh2")


print("------take---------")
// count 만큼만 방출
// skip과 반대
Observable.of("1", "2", "3", "4", "5", "6", "7")
    .take(3)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("------takeWhile---------")

Observable.of("1", "2", "3", "4", "5", "6", "7")
    .take(while: {
        $0 != "4"
    })
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)


print("------enumerated---------")
// 방출된 요소의 인덱스를 확인하고 싶을 때 사용
Observable.of("1", "2", "3", "4", "5", "6", "7")
    .enumerated()
    .take(while: {
        $0.index < 3
    })
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("------takeUntil---------")
let guset22 = PublishSubject<String>()
let closeTime = PublishSubject<String>()

guset22
    .take(until: closeTime)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

guset22.onNext("gkdl1")
guset22.onNext("gkdl2")

closeTime.onNext("now")

guset22.onNext("chleh2")


print("------distinctUntilChanged---------")

// 연달아 같은 값이 방출되면 중복을 막아줌
Observable.of("1", "2", "3", "3", "3", "6", "6")
    .distinctUntilChanged()
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)
