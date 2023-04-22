//
//  SliderViewController.swift
//  PlayGroundApp
//
//  Created by Ramazan Öğünç on 12.04.2023.
//

import UIKit

class ExampleViewController: ContentViewController {
    
    
    private let viewModel = ExampleViewModel()
    override var baseViewModel: BaseViewModel? {
        return self.viewModel
    }
    
    private let btnNext : UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .green
        btn.layer.cornerRadius = 5
        btn.tintColor = .black
        btn.setTitle("Push navigation Example", for: .normal)
        btn.addTarget(self, action: #selector(clickBtnNext), for: .touchUpInside)
        return btn
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
    
    
    @objc private func clickBtnNext() {
        print("tıklandı anam")
        let vc = UIViewController()
        vc.view.backgroundColor = .blue
        vc.title = "Deneme"
        vc.navigationController?.navigationBar.backItem?.title = "Example"
        navigationController?.pushViewController(vc, animated: true)

    }

}

// MARK: SETUP VIEWS
extension ExampleViewController {
    
    private func setupViews() {
        title = "Example"
        view.backgroundColor = .white
        
        view.addSubview(btnNext)
        btnNext.topToSuperview(offset: 15 , usingSafeArea: true)
        btnNext.leadingToSuperview(offset: 15)
        btnNext.trailingToSuperview(offset: 15)
    }
    
}
