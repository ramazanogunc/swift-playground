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
    
    private lazy var cwLayoutConfig: UICollectionLayoutListConfiguration = {
        var layoutConfig = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        layoutConfig.trailingSwipeActionsConfigurationProvider = { [weak self] (indexPath) in
//            guard let self = self else { return nil }
            let todo = self?.viewModel.activeList()[indexPath.row]
            let actionHandler: UIContextualAction.Handler = { action, view, completion in
                if let todo = todo {
                    let alert = DeleteAlertController(onDelete: {
                        self?.viewModel.delete(todo: todo)
                        completion(true)
                    }, onCancel: {
                        completion(true)
                    })
                    self?.present(alert,
                            animated: true,
                            completion: nil
                    )
                } else {
                    completion(true)
                }
                
            }
            let action = UIContextualAction(style: .normal, title: "Delete", handler: actionHandler)
            action.image = UIImage(systemName: "trash")
            action.backgroundColor = .red
            return UISwipeActionsConfiguration(actions: [action])
        }
        return layoutConfig
    }()
    
    private lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewCompositionalLayout.list(using: cwLayoutConfig)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    private let segmentControl : UISegmentedControl = {
       let sc = UISegmentedControl()
        sc.insertSegment(withTitle: "Todos", at: 0, animated: true)
        sc.insertSegment(withTitle: "Comleted", at: 1, animated: true)
        sc.addTarget(self, action: #selector(changeSegment), for: .valueChanged)
        sc.selectedSegmentIndex = 0
        return sc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureRightMenu(UIImage(systemName: "line.horizontal.3"))
        setupViews()
        viewModel.updateCollectionView = { [weak self] in
            self?.updateSegmentsTitle()
           
            self?.collectionView.reloadData()
        }
        viewModel.fetchData()
    
    }
    
    private func updateSegmentsTitle() {
        self.segmentControl.setTitle("Todos(\(viewModel.todos.count))", forSegmentAt: 0)
        self.segmentControl.setTitle("Comleted(\(viewModel.comletedTodos.count))", forSegmentAt: 1)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        clearNavigationBarColor()
    }
    
    @objc private func addNewTask(){
       showAlert()
   }
    
    @objc private func changeSegment(_ sender: UISegmentedControl) {
        viewModel.selectedIndex = sender.selectedSegmentIndex
    }

}


// MARK: SETUP VIEWS
extension TodoViewController {
    
    private func setupViews() {
        title = "Todo"
        view.backgroundColor = collectionView.backgroundColor
        navigationItem.leftBarButtonItem = UIBarButtonItem(
                    barButtonSystemItem: .add,
                    target: self,
                    action: #selector(addNewTask)
                )
        setupSegmentControler()
        setupCollectionView()
    }
    
    private func setupSegmentControler() {
        view.addSubview(segmentControl)
        segmentControl.topToSuperview(offset: 10, usingSafeArea: true)
        segmentControl.leadingToSuperview(offset: 16)
        segmentControl.trailingToSuperview(offset: 16)
    }
    
    private func setupCollectionView() {
        collectionView.register(TodoCell.self, forCellWithReuseIdentifier: "cell")
        view.addSubview(collectionView)
        collectionView.topToBottom(of: segmentControl, offset: 10)
        collectionView.leadingToSuperview()
        collectionView.trailingToSuperview()
        collectionView.bottomToSuperview()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}


extension TodoViewController : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, TodoCellDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.activeList().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell" , for: indexPath) as! TodoCell
        cell.data = viewModel.activeList()[indexPath.row]
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func didChangeCompleted(todo: Todo, isCompleted: Bool) {
        viewModel.updateTodo(todo: todo, isCompleted: isCompleted)
    }
    
    
    
}

// MARK: - Alert Controller
extension TodoViewController {
    private func showAlert(task: Todo? = nil, completion: (() -> Void)? = nil) {
        let title = task != nil ? "Update Todo" : "New Todo"
        let alert = UIAlertController.createAlertController(withTitle: title)
        
        alert.action(task: task) { name in
            if let task = task, let completion = completion {
                task.name = name
                StorageManager.shared.update(task)
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




