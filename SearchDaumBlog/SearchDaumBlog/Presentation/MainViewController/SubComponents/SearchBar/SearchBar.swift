//
//  SearchBar.swift
//  SearchDaumBlog
//
//  Created by 장희선 on 2022/01/12.
//


// 텍스트 입력에 따라 mainview가 알 수 있도록 하는 이벤트가 필요함
// 검색을 눌렀을 때 이벤트를 전달한다
import RxSwift
import RxCocoa
import SnapKit
import UIKit

class SearchBar: UISearchBar {
    let disposeBag = DisposeBag()
    
    let searchButton = UIButton()
    
    // SearchBar 버튼 탭 이벤트
    // PublishRelay ui에 특화되어 있음 onNext만 받음
    // 버튼은 값을 전달하는것이 아니라 이벤트만 전달하기 때문에 void 사용
    
    let searchButtonTapped = PublishRelay<Void>()
    
    // SearchBar 외부로 방출할 이벤트
    
    var shouldLoadResult = Observable<String>.of("")
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        bind()
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // rx를 사용할 때 vc와 ui를 bind 하는 작업
    private func bind() {
        // searchBar button tapped
        // keyboard search button tapped
        
        Observable
            .merge(
                self.rx.searchButtonClicked.asObservable(),
                searchButton.rx.tap.asObservable()
            )
        // 버튼 클릭 이벤트를 searchButtonTapped로 전달
            .bind(to: searchButtonTapped)
            .disposed(by: disposeBag)
        
        // 타이핑이 끝났다고 간주하
        searchButtonTapped
            .asSignal()
            .emit(to: self.rx.endEditing)
            .disposed(by: disposeBag)
        
        self.shouldLoadResult = searchButtonTapped
            .withLatestFrom(self.rx.text) { $1 ?? ""}
            .filter {!$0.isEmpty }
            .distinctUntilChanged()
    }
    
    // 뷰를 꾸미는 코드
    private func attribute() {
        searchButton.setTitle("검색", for: .normal)
        searchButton.setTitleColor(.systemBlue, for: .normal)
    }
    
    private func layout() {
        addSubview(searchButton)
        searchTextField.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(12)
            $0.trailing.equalTo(searchButton.snp.leading).offset(-12)
            $0.centerY.equalToSuperview()
        }
        
        searchButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(12)
        }
    }
}

extension Reactive where Base: SearchBar {
    // 키보드 내려가게 해줌
    var endEditing: Binder<Void> {
        return Binder(base) { basse, _ in
            base.endEditing(true)
        }
    }
}
