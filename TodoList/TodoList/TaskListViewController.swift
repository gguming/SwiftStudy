//
//  TaskListViewController.swift
//  TodoList
//
//  Created by SUN on 2022/08/18.
//

import UIKit
import SnapKit
import RxSwift

class TaskListViewController: UIViewController {
    
    private lazy var segmentControl: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["All", "Hight", "Medium", "Low"])
        segment.selectedSegmentIndex = 0
        return segment
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemBackground
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TaskListTableViewCell.self, forCellReuseIdentifier: TaskListTableViewCell.identifier)
        return tableView
    }()
    
    private lazy var addButton: UIBarButtonItem = {
        let barButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAddButton))
        return barButton
    }()
    
    @objc func didTapAddButton() {
        let addTaskNaviViewController = UINavigationController(rootViewController: AddTaskViewController())
        addTaskNaviViewController.navigationItem.title = "Add Task"
        addTaskNaviViewController.modalPresentationStyle = .fullScreen
        self.present(addTaskNaviViewController, animated: true)
        
    }
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        self.view.backgroundColor = .red
        navigationItem.title = "GoodList"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupUI()
    }
    
    private func setupUI() {
        [segmentControl, tableView]
            .forEach({ view.addSubview($0)})
        
        
        segmentControl.snp.makeConstraints({
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20.0)
            $0.centerX.equalToSuperview()
        })
        
        tableView.snp.makeConstraints({
            $0.top.equalTo(segmentControl.snp.bottom).offset(10.0)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        })
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAddButton))
        
        let addTaskViewController = AddTaskViewController()
        addTaskViewController.taskSubjectObservable
            .subscribe(onNext: { task in
                print(task)
            })
            .disposed(by: disposeBag)
    }


}

extension TaskListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TaskListTableViewCell.identifier, for: indexPath) as? TaskListTableViewCell
        
        return cell ?? UITableViewCell()
    }
    
    
}

