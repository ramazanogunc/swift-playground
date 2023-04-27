//
//  TodoViewController.swift
//  PlayGroundApp
//
//  Created by Ramazan Öğünç on 26.04.2023.
//

import UIKit
import TinyConstraints

class TodoViewController: ContentViewController {
    
    private let viewModel = TodoViewModel()
    override var baseViewModel: BaseViewModel? {
        return self.viewModel
    }
    
    private let collectionView : UICollectionView = {
        let layoutConfig = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let layout = UICollectionViewCompositionalLayout.list(using: layoutConfig)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureRightMenu(UIImage(systemName: "line.horizontal.3"))
        setupViews()
    
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        clearNavigationBarColor()
    }

}


// MARK: SETUP VIEWS
extension TodoViewController {
    
    private func setupViews() {
        title = "Todo"
        view.backgroundColor = .white
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.register(TodoCell.self, forCellWithReuseIdentifier: "cell")
        view.addSubview(collectionView)
        collectionView.topToSuperview()
        collectionView.leadingToSuperview()
        collectionView.trailingToSuperview()
        collectionView.bottomToSuperview()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}


extension TodoViewController : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.todos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell" , for: indexPath) as! TodoCell
        cell.data = viewModel.todos[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    
}

