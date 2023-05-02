//
//  FlowCollectionViewController.swift
//  PlayGroundApp
//
//  Created by Ramazan Öğünç on 01.05.2023.
//

import UIKit
import TinyConstraints

class FlowCollectionViewController : ContentViewController {
    
    private let viewModel = FlowCollectionViewModel()
    override var baseViewModel: BaseViewModel? {
        return viewModel
    }
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collectionView.isUserInteractionEnabled = true
        collectionView.alwaysBounceHorizontal = true
        collectionView.register(SliderCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()
    
    private let lblColumn: UILabel = {
        let lbl = UILabel()
        lbl.text = "Column Size: 1"
        lbl.layer.cornerRadius = 8
        lbl.layer.borderColor = .init(gray: 0.5, alpha: 0.5)
        lbl.addTarget(self, action: #selector(clickChangeColumn), for: .touchUpInside)
        return lbl
    }()
    
    private let stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureRightMenu(UIImage(systemName: "line.horizontal.3"))
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
        changeNavigationBarColor(.green)
    }

    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        self.collectionView.collectionViewLayout.invalidateLayout()
        coordinator.animate(alongsideTransition: {(_) in
            self.collectionView.isPagingEnabled = false
            let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }, completion: { (_) in
            self.collectionView.isPagingEnabled = true
        })
    }
    
    @objc private func clickChangeColumn(_ sender: UILabel!) {
        
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
        collectionView.bottomToTop(of: stackView)
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
        return viewModel.pages.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "slider_cell" , for: indexPath) as! SliderCell
        cell.data = viewModel.pages[indexPath.row]

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
        
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame .width)
    }
}

