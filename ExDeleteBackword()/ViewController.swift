//
//  ViewController.swift
//  ExDeleteBackword()
//
//  Created by 김종권 on 2023/11/28.
//

import UIKit

class ViewController: UIViewController {
    private let textView = {
        let v = UITextView()
        v.textColor = .black
        v.font = .systemFont(ofSize: 24)
        v.backgroundColor = .lightGray
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    private let deleteButton: UIButton = {
        let button = UIButton()
        button.setTitle("delete", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        deleteButton.addTarget(self, action: #selector(tap), for: .touchUpInside)
        
        view.addSubview(textView)
        view.addSubview(deleteButton)
        
        NSLayoutConstraint.activate([
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            textView.heightAnchor.constraint(equalToConstant: 500),
        ])
        
        NSLayoutConstraint.activate([
            deleteButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 16),
            deleteButton.centerXAnchor.constraint(equalTo: textView.centerXAnchor),
        ])
        
        textView.delegate = self
    }

    @objc func tap() {
        textView.deleteBackward()
    }
}

extension ViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "!" {
            textView.deleteBackward()
            textView.insertText("느낌표")
            return false
        }
        
        return true
    }
}
