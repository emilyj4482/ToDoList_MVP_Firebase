//
//  TodoListPresenter.swift
//  ToDoList_MVP_FireBase
//
//  Created by EMILY on 16/10/2023.
//

import UIKit

protocol TodoListProtocol {
    func setTitle()
    func setupViews()
}

final class TodoListPresenter: NSObject {
    private let viewController: TodoListProtocol
    
    init(viewController: TodoListProtocol) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        viewController.setTitle()
        viewController.setupViews()
    }
}

extension TodoListPresenter: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TaskCell.identifier, for: indexPath) as? TaskCell else { return UICollectionViewCell() }
        
        cell.setup()
        
        return cell
    }
}

extension TodoListPresenter: UICollectionViewDelegate {
    
}
