//
//  MainViewModel.swift
//  SearchDaumBlog
//
//  Created by 장희선 on 2022/01/12.
//

import RxCocoa
import RxSwift
import Foundation

struct MainViewModel {
    let disposeBag = DisposeBag()
    
    let blogListViewModel = BlogListViewModel()
    let searchBarViewModel = SearchBarViewModel()
    
    let alertActionTapped = PublishRelay<MainViewController.AlertAction>()
    let shouldPresentAlert: Signal<MainViewController.Alert>
    init(model: MainModel = MainModel()) {
        let blogResult = searchBarViewModel.shouldLoadResult
            .flatMapLatest { query in
//                SearchBlogNetwork().searchBlog(query: query)
                model.searchBlog(query)
            }
            .share()
        
        let blogValue = blogResult
            .compactMap(model.getBlogValue)
//            .compactMap { data -> DKBlog? in
//                guard case .success(let value) = data else {
//                    return nil
//                }
//                return value
//            }
        
        let blogError = blogResult
            .compactMap(model.getBlogError)
//            .compactMap{ data -> String? in
//                guard case .failure(let error) = data else {
//                    return nil
//                }
//                return error.localizedDescription
//            }
        
        let cellData = blogValue
            .map(model.getBlogListCellData)
//            .map { blog -> [BlogListCellData] in
//                return blog.documents
//                    .map { doc in
//                        let thumbnailURL = URL(string: doc.thumbnail ?? "")
//                        return BlogListCellData(
//                            thumbnailURL: thumbnailURL,
//                            name: doc.name,
//                            title: doc.title,
//                            datetime: doc.datetime)
//                    }
//            }
        
        // FilterView를 선택했을 때 나오는 alertsheet를 선택했을 때 type
        let sortedType = alertActionTapped
            .filter {
                switch $0 {
                case .title, .datetime:
                    return true
                default:
                    return false
                }
            }
            .startWith(.title)
        
        // MainViewController -> ListView
//        Observable
//            .combineLatest(
//                sortedType,
//                cellData
//            ) {
//                type, data -> [BlogListCellData] in
//                switch type {
//                case .title:
//                    return data.sorted { $0.title ?? "" < $1.title ?? ""}
//
//                case .datetime:
//                    return data.sorted { $0.datetime ?? Date() > $1.datetime ?? Date()}
//                default:
//                    return data
//                }
//            }
        Observable
            .combineLatest(
                sortedType,
                cellData,
                resultSelector: model.sort
            )
            .bind(to: blogListViewModel.blogCellData)
            .disposed(by: disposeBag)
        
        let alertSheetForSorting = blogListViewModel.filterViewModel.sortButtonTapped
            .map { _ -> MainViewController.Alert in
                return (title: nil, message: nil, actions: [.title, .datetime, .cancel], style: .actionSheet)
            }
        
        let alertForErrorMessage = blogError
            .map { message -> MainViewController.Alert in
                return (
                    title: "앗!",
                    message: "예상치 못한 오류가 발생했습니다. \(message)",
                    actions: [.confirm],
                    style: .alert
                )
            }
        
        self.shouldPresentAlert = Observable
            .merge(
                alertSheetForSorting,
                alertForErrorMessage
            )
            .asSignal(onErrorSignalWith: .empty())
        
    }
}
