//
//  FlowCollectionViewController.swift
//  PlayGroundApp
//
//  Created by Ramazan Öğünç on 1.05.2023.
//

import UIKit

class FlowCollectionViewController : ContentViewController {
    
    private let viewModel = FlowCollectionViewModel()
    override var baseViewModel: BaseViewModel? {
        return viewModel
    }
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isUserInteractionEnabled = true
        collectionView.register(FlowCellCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()
    
    private let lblColumn: UIButton = {
        let lbl = UIButton(type: .system)
        lbl.setTitle("Change column size", for: .normal)
        lbl.layer.cornerRadius = 8
        lbl.layer.borderWidth = 1
        lbl.layer.borderColor = .init(gray: 0.5, alpha: 0.5)
        lbl.addTarget(self, action: #selector(clickChangeColumn), for: .touchUpInside)
        return lbl
    }()
    
    private let picker: StandardPicker = StandardPicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
        changeNavigationBarColor(.green)
    }

    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        self.collectionView.collectionViewLayout.invalidateLayout()
    }
    
    @objc private func clickChangeColumn(_ sender: UIButton!) {
        if view.subviews.contains(where: { $0 is StandardPicker }) {
            view.subviews.filter({ $0 is StandardPicker }).forEach({ $0.removeFromSuperview() })
        } else {
            view.addSubview(picker)
            picker.bottomToSuperview(usingSafeArea: true)
            picker.leadingToSuperview()
            picker.trailingToSuperview()
            picker.data = viewModel.options
            picker.delegate = self
        }

    }
}


// MARK: SETUP VIEWS
extension FlowCollectionViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private func setupViews() {
        title = "Flow CollectionView"
        view.backgroundColor = .white
        setupTopView()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.topToBottom(of: lblColumn, offset: 10)
        collectionView.leadingToSuperview()
        collectionView.trailingToSuperview()
        collectionView.bottomToSuperview(usingSafeArea: true)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func setupTopView() {
        view.addSubview(lblColumn)
        
        lblColumn.topToSuperview(offset: 10, usingSafeArea: true)
        lblColumn.leadingToSuperview(offset: 16)
        lblColumn.trailingToSuperview(offset: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell" , for: indexPath) as! FlowCellCollectionViewCell
        
        cell.data = indexPath.row + 1

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = Double(view.frame.width) / viewModel.columnSize
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
        
}

// MARK: CELL DELEGATE
extension FlowCollectionViewController : StandardPickerDelegate {
    func didSelect(option: String) {
        if let option = Double(option) {
            viewModel.columnSize = option
            collectionView.reloadData()
        }
    }
}

