//
//  TranslateViewController.swift
//  translate
//
//  Created by SUN on 2022/08/15.
//

import Foundation
import UIKit
import SnapKit



final class TranslateViewController: UIViewController {
    
    private var translateManager = TranslateManager()
    private lazy var sourceLanguageButton: UIButton = {
        let button = UIButton()
        button.setTitle(translateManager.sourceLanguage.title, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15.0, weight: .semibold)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .systemBackground
        button.layer.cornerRadius = 9.0
        button.addTarget(self, action: #selector(didTapSourceLanguageButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var targetLanguageButton: UIButton = {
        let button = UIButton()
        button.setTitle(translateManager.targetLanguage.title, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15.0, weight: .semibold)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .systemBackground
        button.layer.cornerRadius = 9.0
        button.addTarget(self, action: #selector(didTapTargetLanguageButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.spacing = 8.0
        [sourceLanguageButton, targetLanguageButton]
            .forEach { stackView.addArrangedSubview($0) }
        return stackView
    }()
    
    private lazy var resultBaseView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 23.0, weight: .bold)
        label.textColor = .systemPink
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var bookmarkbutton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "bookmark"), for: .normal)
        button.addTarget(self, action: #selector(didTapBookmarkButton), for: .touchUpInside)
        return button
    }()
    
    @objc func didTapBookmarkButton() {
        guard let sourceText = sourceLabel.text,
              let translateText = resultLabel.text,
              bookmarkbutton.imageView?.image == UIImage(systemName: "bookmark")
        else { return }
        bookmarkbutton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
        let currentBookmark: [Bookmark] = UserDefaults.standard.bookmarks
        let newBookmark = Bookmark(sourceLanguage: translateManager.sourceLanguage,
                                   translateLanguage: translateManager.targetLanguage,
                                   sourceText: sourceText,
                                   translatedText: translateText)
        
        UserDefaults.standard.bookmarks = [newBookmark] + currentBookmark
        
        print(UserDefaults.standard.bookmarks)
    }
    
    private lazy var copybutton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "doc.on.doc"), for: .normal)
        button.addTarget(self, action: #selector(didTapCopyButton), for: .touchUpInside)
        return button
    }()
    
    @objc func didTapCopyButton() {
        UIPasteboard.general.string = resultLabel.text
    }
    
    private lazy var sourceLabelBaseButton: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapSourceLabelBaseButton))
        view.addGestureRecognizer(gesture)
        return view
    }()
    
    private let sourceLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("Enter_Text", comment: "텍스트 입력")
        label.textColor = .tertiaryLabel
        //TODO: 입력값이 추가되면 placeholder 스타일 해제
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 23.0, weight: .semibold)
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        setupViews()
    }
}

extension TranslateViewController: SourceTextViewControllerDelegate {
    func didEnterText(_ sourceText: String) {
        print("did done")
        if sourceText.isEmpty { return }
        bookmarkbutton.setImage(UIImage(systemName: "bookmark"), for: .normal)
        sourceLabel.text = sourceText
        sourceLabel.textColor = .label
        translateManager.translate(from: sourceText, completionHandler: { [weak self] tranlatedText in
            self?.resultLabel.text = tranlatedText
        })
    }
}


extension TranslateViewController {
    private func setupViews() {
        [
            buttonStackView,
            resultBaseView,
            resultLabel,
            bookmarkbutton,
            copybutton,
            sourceLabelBaseButton,
            sourceLabel
        ]
            .forEach { view.addSubview($0) }
        
        let defaultSpacing: CGFloat = 16.0
        
        buttonStackView.snp.makeConstraints({
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview().inset(defaultSpacing)
            $0.trailing.equalToSuperview().inset(defaultSpacing)
            $0.height.equalTo(50.0)
        })
        
        resultBaseView.snp.makeConstraints({
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalTo(buttonStackView.snp.bottom).offset(defaultSpacing)
            $0.bottom.equalTo(bookmarkbutton.snp.bottom).offset(defaultSpacing) // TODO: 컨텐스 사이즈에 맞게 가변높이로 수정
        })
        
        resultLabel.snp.makeConstraints({
            $0.leading.equalTo(resultBaseView.snp.leading).inset(24.0)
            $0.trailing.equalTo(resultBaseView.snp.trailing).inset(24.0)
            $0.top.equalTo(resultBaseView.snp.top).inset(24.0)
        })
        
        bookmarkbutton.snp.makeConstraints({
            $0.leading.equalTo(resultLabel.snp.leading)
            $0.top.equalTo(resultLabel.snp.bottom).offset(24.0)
            $0.width.equalTo(40.0)
            $0.height.equalTo(40.0)
        })
        
        copybutton.snp.makeConstraints({
            $0.leading.equalTo(bookmarkbutton.snp.trailing).inset(8.0)
            $0.top.equalTo(bookmarkbutton.snp.top)
            $0.width.equalTo(40.0)
            $0.height.equalTo(40.0)
        })
        
        sourceLabelBaseButton.snp.makeConstraints({
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalTo(resultBaseView.snp.bottom).offset(defaultSpacing)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)//.inset(tabBarController?.tabBar.frame.height ?? 0.0)
        })
        
        sourceLabel.snp.makeConstraints({
            $0.leading.equalTo(sourceLabelBaseButton.snp.leading).inset(24.0)
            $0.trailing.equalTo(sourceLabelBaseButton.snp.trailing).inset(24.0)
            $0.top.equalTo(sourceLabelBaseButton.snp.top).inset(24.0)
        })
    }
    
    @objc private func didTapSourceLabelBaseButton() {
        let viewController = SourceTextViewController(delegate: self)
        present(viewController, animated: true)
    }
    
    
    @objc func didTapSourceLanguageButton() {
        didTapLanguageButton(type: .source)
    }
    
    @objc func didTapTargetLanguageButton() {
        didTapLanguageButton(type: .target)
    }
 
    private func didTapLanguageButton(type: `Type`) {
        let alertController = UIAlertController(title: nil,
                                                message: nil,
                                                preferredStyle: .actionSheet)
        
        Language.allCases.forEach({ language in
            let action = UIAlertAction(title: language.title,
                                       style: .default) { [weak self] _ in
                switch type {
                case .source:
                    self?.translateManager.sourceLanguage = language
                    self?.sourceLanguageButton.setTitle(language.title, for: .normal)
                case .target:
                    self?.translateManager.targetLanguage = language
                    self?.targetLanguageButton.setTitle(language.title, for: .normal)
                }
            }
            alertController.addAction(action)
        })
        let cancelAction = UIAlertAction(title: NSLocalizedString("Cancel", comment: "취소"), style: .cancel)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
}
