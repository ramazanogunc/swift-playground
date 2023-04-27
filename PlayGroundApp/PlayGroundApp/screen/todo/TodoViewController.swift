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
        viewModel.updateCollectionView = { [weak self] in
            self?.collectionView.reloadData()
        }
        viewModel.fetchData()
    
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        clearNavigationBarColor()
    }
    
    @objc private func addNewTask(){
       showAlert()
   }

}


// MARK: SETUP VIEWS
extension TodoViewController {
    
    private func setupViews() {
        title = "Todo"
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(
                    barButtonSystemItem: .add,
                    target: self,
                    action: #selector(addNewTask)
                )
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

// MARK: - Alert Controller
extension TodoViewController {
    private func showAlert(task: Todo? = nil, completion: (() -> Void)? = nil) {
        let title = task != nil ? "Update Todo" : "New Todo"
        let alert = UIAlertController.createAlertController(withTitle: title)
        
        alert.action(task: task) { name in
            if let task = task, let completion = completion {
                StorageManager.shared.update(task, newName: name)
                completion()
            } else {
                self.viewModel.save(name: name)
            }
        }
        
        present(alert, animated: true)
    }
}


extension UIAlertController {
    
    static func createAlertController(withTitle title: String) -> UIAlertController {
        UIAlertController(title: title, message: "What do you want to do?", preferredStyle: .alert)
    }
    
    func action(task: Todo?, completion: @escaping (String) -> Void) {
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            guard let newValue = self.textFields?.first?.text else { return }
            guard !newValue.isEmpty else { return }
            completion(newValue)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
        addAction(saveAction)
        addAction(cancelAction)
        addTextField { textField in
            textField.placeholder = "Todo"
            textField.text = task?.name
        }
    }
}




