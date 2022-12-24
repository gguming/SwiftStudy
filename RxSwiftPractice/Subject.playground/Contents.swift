import RxSwift
import Foundation


let disposeBag = DisposeBag()
print("-------PublishSubject---------")

let publishSubject = PublishSubject<String>()

publishSubject.onNext("여러분 안녕하세요?")

let subscriber1 = publishSubject
    .subscribe(onNext: {
        print($0)
    })
    
publishSubject.onNext("들리세요?")
publishSubject.onNext("안들리시나요?")

subscriber1.dispose()

let subscriber2 = publishSubject
    .subscribe(onNext: {
        print($0)
    })
    

publishSubject.onNext("여보세요")
publishSubject.onCompleted()

publishSubject.onNext("다섯번째")

subscriber2.dispose()

publishSubject
    .subscribe{
        print("세번째 구독 : ", $0.element ?? $0)
    }
    .disposed(by: disposeBag)
publishSubject.onNext("찍힐까요?")


print("-------behaviorSubject---------")
// 반드시 초기값을 가져야 함


enum SubjectError: Error {
    case error1
}

let behaviorSubject = BehaviorSubject<String>(value: "초기값")

behaviorSubject.onNext("1, 첫번째 값")

behaviorSubject.subscribe{
    print("첫번째 구독 : ", $0.element ?? $0)
}
.disposed(by: disposeBag)


behaviorSubject.subscribe{
    print("두번째 구독 : ", $0.element ?? $0)
}

let value = try? behaviorSubject.value()
print(value)


print("-------replaySubject---------")
// 버퍼를 가지고 있음
// 버퍼 크기만큼 이전 이벤트를 받아올 수 있다.
let replaySubject = ReplaySubject<String>.create(bufferSize: 2)
replaySubject.onNext("1, 여러분")
replaySubject.onNext("2, 힘내세요")
replaySubject.onNext("3, 어렵지만")

replaySubject.subscribe{
    print("첫번쨰 구독 : ", $0.element ?? $0)
}
.disposed(by: disposeBag)

replaySubject.subscribe{
    print("두번쨰 구독 : ", $0.element ?? $0)
}
.disposed(by: disposeBag)

replaySubject.onNext("4, 할수있어요")
replaySubject.onError(SubjectError.error1)
replaySubject.dispose()


replaySubject.subscribe{
    print("세번쨰 구독 : ", $0.element ?? $0)
}
.disposed(by: disposeBag)


class Object: NSObject {
    
}
