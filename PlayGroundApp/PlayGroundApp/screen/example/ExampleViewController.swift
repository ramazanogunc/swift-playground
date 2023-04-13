//
//  SliderViewController.swift
//  PlayGroundApp
//
//  Created by Ramazan Öğünç on 12.04.2023.
//

import UIKit

class ExampleViewController: ContentViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
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
