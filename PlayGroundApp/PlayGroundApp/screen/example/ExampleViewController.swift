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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureLeftMenu(UIImage(systemName: "line.horizontal.3"))
        setupViews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        clearNavigationBarColor()
    }

}

// MARK: SETUP VIEWS
extension ExampleViewController {
    
    private func setupViews() {
        title = "Example"
        view.backgroundColor = .white
    }
    
}
