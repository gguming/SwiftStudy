import UIKit
import RxSwift

// Observable은 시퀀스의 정의이다.
// 구독되기 전에는 아무 이벤트도 내보내지 않음(SubScribe 해주어야 함)
// just는 1개에 대해서만 시퀀스 생성 가능
Observable<Int>.just(1)
    .subscribe(onNext: {
        print($0)
    })

Observable<Int>.of(1,2,3,4,5)
    .subscribe(onNext: {
        print($0)
    })
//of 는 여러개를 받을 수 있고 타입 추론 가능
// 아래는 just를 쓴것과 같음
Observable.of([1,2,3,4,5])
    .subscribe(onNext: {
        print($0)
    })

// from은 Array 형태만 받고 Array 안의 인자를 타임 추론하여 방출한다.
Observable.from([1,2,3,4,5])
    .subscribe(onNext: {
        print($0)
    })

// of 는 바로 subscribe 할 수 있음
Observable.of(1,2,3)
    .subscribe {
        print($0)
    }

// 기존 방식처럼 나옴
Observable.of(1,2,3)
    .subscribe{
        if let element = $0.element {
            print(element)
        }
    }

Observable.of(1,2,3)
    .subscribe(onNext: {
        print($0)
    })

// 이벤트 방출하지 않음
// Void를 출가하면 complete됨
// 즉시 종료할 수 있는 observable이나 의도적으로 0개의 observable을 리턴하고 싶을 때 사용
Observable<Void>.empty()
    .subscribe{
        print($0)
    }


// 아무것도 방출하지 않음
// debug를 통해서 작동하는지 확인할 수 있음
Observable<Void>.never()
    .debug("never")
    .subscribe(
        onNext:{
            print($0)
        },
        onCompleted: {
            print("complete")
        }
    )

Observable.range(start: 1, count: 9)
    .subscribe(onNext: {
        print("2*\($0) = \(2*$0)")
    })


// dispose를 사용하면 구독을 취소할 수 있다
print("------dispose-------")

Observable.of(1,2,3)
    .subscribe{
        print($0)
    }
    .dispose()

print("------disposeBag-------")

// dispose를 사용하면서 메모리 누수를 막을 수 있다.
let disposeBag = DisposeBag()
Observable.of(1,2,3)
    .subscribe{
        print($0)
    }
    .disposed(by: disposeBag)

print("------create1-------")

Observable.create { observer -> Disposable in
    observer.onNext(1)
//    //위와 같은 코드
//    observer.on(.next(1))
    observer.onCompleted()
    observer.onNext(2)
    
    return Disposables.create()
}
.subscribe{
    print($0)
}
.disposed(by: disposeBag)


print("------create2-------")
enum MyError: Error {
    case anError
}

Observable.create { observer -> Disposable in
    observer.onNext(1)
    observer.onError(MyError.anError)
    observer.onCompleted()
    observer.onNext(2)
    return Disposables.create()
}
.subscribe {
    print($0)
} onError: {
    print($0.localizedDescription)
} onCompleted: {
    print("complete")
} onDisposed: {
    print("disposed")
}
.disposed(by: disposeBag)


print("------deffered1-------")
// 서브스크라이브에 observable을 제공하는 observable factory를 만드는 방식
Observable.deferred {
    Observable.of(1,2,3)
}
.subscribe{
    print($0)
}
.disposed(by: disposeBag)


print("------deffered2-------")
// 뒤집기
// deferred를 통해서 observable을 생성해줄 수 있다.
var oposite: Bool = false

let factory: Observable<String> = Observable.deferred {
    oposite = !oposite
    
    if oposite {
        return Observable.of("👍")
    } else {
        return Observable.of("👎")
    }
}

for _ in 0...3 {
    factory.subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)
    
}
