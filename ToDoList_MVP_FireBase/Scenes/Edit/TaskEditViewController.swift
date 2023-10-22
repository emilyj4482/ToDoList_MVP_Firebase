//
//  TaskEditViewController.swift
//  ToDoList_MVP_FireBase
//
//  Created by EMILY on 10/22/23.
//

import UIKit

final class TaskEditViewController: UIViewController {
    
    let tm = TodoManager.shared
    
    private lazy var presenter = TaskEditPresenter(viewController: self)
    
    private lazy var doneImage: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        
        textField.becomeFirstResponder()
        
        return textField
    }()
    
    private lazy var doneButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Done", for: .normal)
        button.setTitleColor(.mainTintColor, for: .normal)
        button.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

extension TaskEditViewController: TaskEditProtocol {
    private func layout() {
        
        view.backgroundColor = .systemBackground
        self.sheetPresentationController?.detents = [.custom(resolver: { _ in return 50 })]
        
        [doneImage, textField, doneButton]
            .forEach {
                view.addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
        
        let superview = view.safeAreaLayoutGuide
        let inset: CGFloat = 16.0
        
        NSLayoutConstraint.activate([
            
            doneImage.widthAnchor.constraint(equalToConstant: 20.0),
            doneImage.heightAnchor.constraint(equalToConstant: 20.0),
            
            doneImage.topAnchor.constraint(equalTo: superview.topAnchor, constant: inset),
            doneImage.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: inset),
            
            textField.centerYAnchor.constraint(equalTo: doneImage.centerYAnchor),
            textField.leadingAnchor.constraint(equalTo: doneImage.trailingAnchor, constant: 10.0),
            
            doneButton.centerYAnchor.constraint(equalTo: textField.centerYAnchor),
            doneButton.leadingAnchor.constraint(equalTo: textField.trailingAnchor),
            doneButton.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -inset)
        ])
    }
    
    func configure() {
        layout()
        
        doneImage.image = UIImage(systemName: "circle")
        doneImage.tintColor = .red
    }
    
    func dismiss() {
        dismiss(animated: true)
    }
}

private extension TaskEditViewController {
    @objc func doneButtonTapped() {
        presenter.doneButtonTapped()
        print("Done btn tapped")
    }
}