//
//  SliderViewController.swift
//  PlayGroundApp
//
//  Created by Ramazan Öğünç on 12.04.2023.
//

import UIKit
import TinyConstraints

class SliderViewController: ContentViewController {
    
    private let viewModel = SliderViewModel()
    override var baseViewModel: BaseViewModel? {
        return viewModel
    }
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collectionView.isPagingEnabled = true
        collectionView.isScrollEnabled = true
        collectionView.isUserInteractionEnabled = true
        collectionView.alwaysBounceHorizontal = true
        collectionView.register(SliderCell.self, forCellWithReuseIdentifier: "slider_cell")
        
        return collectionView
    }()
    
    private let btnNext: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Next", for: .normal)
        btn.addTarget(self, action: #selector(clickBtnNext), for: .touchUpInside)
        return btn
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .darkGray
        return pageControl
    }()
    
    private let btnPrevious: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Previous", for: .normal)
        btn.addTarget(self, action: #selector(clickBtnPrevious), for: .touchUpInside)
        return btn
    }()
    
    private let stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureRightMenu(UIImage(systemName: "line.horizontal.3"))
        setupViews()
    }
    
    override func viewWillAppear(_ animateanimated: Bool) {
        changeNavigationBarColor(.green)
    }
    
    @objc func clickBtnNext(_ sender: UIButton!) {
        collectionView.isPagingEnabled = false
        pageControl.currentPage = (pageControl.currentPage + 1) % pageControl.numberOfPages
        let newIndex = IndexPath(item: pageControl.currentPage, section: 0)
        collectionView.scrollToItem(at: newIndex , at: .centeredHorizontally, animated: true)
        collectionView.isPagingEnabled = true
    }
    
    @objc func clickBtnPrevious(_ sender: UIButton!) {
        collectionView.isPagingEnabled = false
        let previousIndex = pageControl.currentPage - 1 == -1 ? pageControl.numberOfPages - 1 : pageControl.currentPage - 1
        pageControl.currentPage = previousIndex % pageControl.numberOfPages
        let newIndex = IndexPath(row: pageControl.currentPage, section: 0)
        collectionView.scrollToItem(at: newIndex , at: .centeredHorizontally, animated: true)
        collectionView.isPagingEnabled = true
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
}


// MARK: SETUP VIEWS
extension SliderViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private func setupViews() {
        title = "Slider"
        view.backgroundColor = .white
        setupBottomView()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.topToSuperview()
        collectionView.leadingToSuperview()
        collectionView.trailingToSuperview()
        collectionView.bottomToTop(of: stackView)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func setupBottomView() {
        stackView.addArrangedSubview(btnPrevious)
        stackView.addArrangedSubview(pageControl)
        stackView.addArrangedSubview(btnNext)
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        stackView.bottomToSuperview(usingSafeArea: true)
        stackView.leadingToSuperview()
        stackView.trailingToSuperview()
        stackView.height(50)
        
        pageControl.numberOfPages = viewModel.pages.count
        pageControl.currentPage = 0
        pageControl.sizeToFit()
        pageControl.layoutIfNeeded()
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

