//
//  AddTaskViewController.swift
//  TodoList
//
//  Created by SUN on 2022/08/22.
//

import SnapKit
import UIKit
import RxSwift


class AddTaskViewController: UIViewController {
    
    private lazy var segmentControl: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["Hight", "Medium", "Low"])
        segment.selectedSegmentIndex = 0
        return segment
    }()
    
    private lazy var taskTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .gray
        return textField
    }()
    
    private lazy var saveButton: UIBarButtonItem = {
        let barButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(didTapSaveButton))
        return barButton
    }()
    
    @objc func didTapSaveButton() {
        guard let priority = Priority(rawValue: self.segmentControl.selectedSegmentIndex),
              let title = self.taskTextField.text else { return }
        
        let task = Task(title: title, priority: priority)
        taskSubject.onNext(task)
        self.dismiss(animated: true)
    }
    
    let taskSubject = PublishSubject<Task>()
    
    var taskSubjectObservable: Observable<Task> {
        return taskSubject.asObservable()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        navigationItem.rightBarButtonItem = saveButton
        navigationItem.title = "Add Task"
        [segmentControl, taskTextField]
            .forEach({
                self.view.addSubview($0)
            })
        
        segmentControl.snp.makeConstraints({
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20.0)
            $0.centerX.equalToSuperview()
        })
        
        taskTextField.snp.makeConstraints({
            $0.center.equalToSuperview()
            $0.width.equalTo(200.0)
        })
    }
}
