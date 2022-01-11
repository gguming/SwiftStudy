import RxSwift
import RxCocoa
import UIKit
import PlaygroundSupport


 let disposebag = DisposeBag()


print("----------replay----------")
// replay의 버퍼만큼 구독 전의 지난 아이템을 볼 수 있음
let hello = PublishSubject<String>()
let bird = hello.replay(1)

bird.connect()

hello.onNext("1 hello")
hello.onNext("2. hi")

bird
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposebag)

hello.onNext("3 안녕")

print("----------replayAll----------")
// 구독한 시점 이전의 모든 이벤트 방출을 볼 수 있다.
let doctor = PublishSubject<String>()
let timeStone = doctor.replayAll()
timeStone.connect()

doctor.onNext("도마무르")
doctor.onNext("거래를 하러 왔다")

timeStone
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposebag)



print("----------buffer----------")
// array 방출
//let source = PublishSubject<String>()
//
//var count = 0
//let timer = DispatchSource.makeTimerSource()
//
//timer.schedule(deadline: .now() + 2, repeating: .seconds(1))
//timer.setEventHandler {
//    count += 1
//    source.onNext("\(count)")
//}
//timer.resume()
//
//source
//    .buffer(
//        timeSpan: .seconds(2),
//        count: 2, // 버퍼 최대 카운트
//        scheduler: MainScheduler.instance)
//    .subscribe(onNext: {
//        print($0)
//    })
//    .disposed(by: disposebag)


print("----------window----------")
// observable 방출

//let observableCout = 5
//
//let makeTime = RxTimeInterval.seconds(2) // observable을 만드는 시간 제한
//
//let window = PublishSubject<String>()
//var windowCount = 0
//let windowTimerSource = DispatchSource.makeTimerSource()
//windowTimerSource.schedule(deadline: .now() + 2, repeating: .seconds(1))
//windowTimerSource.setEventHandler {
//    windowCount += 1
//    window.onNext("\(windowCount)")
//}
//windowTimerSource.resume()
//
//window
//    .window(
//        timeSpan: makeTime,
//        count: observableCout,
//        scheduler: MainScheduler.instance
//    )
//    .flatMap { windowObservable -> Observable<(index: Int, element: String)> in
//        return windowObservable.enumerated()
//    }
//    .subscribe(onNext: {
//        print("\($0.index)번째 Observable의 요소 \($0.element)")
//    })
//    .disposed(by: disposebag)


print("----------delaySubscription----------")
// 구독 지연
//let delaySource = PublishSubject<String>()
//
//var delayCount = 0
//
//let delayTimeSource = DispatchSource.makeTimerSource()
//delayTimeSource.schedule(deadline: .now() + 2, repeating: .seconds(1))
//delayTimeSource.setEventHandler {
//    delayCount += 1
//    delaySource.onNext("\(delayCount)")
//}
//delayTimeSource.resume()
//
//delaySource
//    .delaySubscription(.seconds(2), scheduler: MainScheduler.instance)
//    .subscribe(onNext: {
//        print($0)
//    })
//    .disposed(by: disposebag)


print("----------delay----------")
// 요소의 방출의 시간을 조절

//let delaySubject = PublishSubject<Int>()
//
//var delayCount = 0
//
//let delayTimeSource = DispatchSource.makeTimerSource()
//delayTimeSource.schedule(deadline: .now() + 2, repeating: .seconds(1))
//delayTimeSource.setEventHandler {
//    delayCount += 1
//    delaySubject.onNext(delayCount)
//}
//delayTimeSource.resume()
//
//delaySubject
//    .delay(.seconds(3), scheduler: MainScheduler.instance)
//
//    .subscribe(onNext: {
//        print($0)
//    })
//    .disposed(by: disposebag)
//


print("----------interval----------")
// 타이머를 rx로 구현한는 방법

//Observable<Int>
//    .interval(.seconds(3), scheduler: MainScheduler.instance)
//    .subscribe(onNext: {
//        print($0)
//    })
//    .disposed(by: disposebag)



print("----------timer----------")
// interval보다 더 강력한 기능
//
//Observable<Int>
//    .timer(
//        .seconds(5),
//        period: .seconds(2),
//        scheduler: MainScheduler.instance
//    )
//    .subscribe(onNext: {
//        print($0)
//    })
//    .disposed(by: disposebag)


print("----------timeOut----------")
// 시간을초과하면 시퀀스를 종료시킴
let button = UIButton(type: .system)
button.setTitle("눌러주세요!", for: .normal)
button.sizeToFit()

PlaygroundPage.current.liveView = button

button.rx.tap
    .do(onNext: {
        print("tap")
    })
    .timeout(.seconds(5), scheduler: MainScheduler.instance)
    .subscribe {
        print($0)
    }
    .disposed(by: disposebag)
