//
//  SliderViewController.swift
//  PlayGroundApp
//
//  Created by Ramazan Öğünç on 12.04.2023.
//

import UIKit

class SliderViewController: ContentViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        changeNavigationBarColor(.green)
    }

}


// MARK: SETUP VIEWS
extension SliderViewController {
    
    private func setupViews() {
        title = "Slider"
        view.backgroundColor = .white
    }
    
}

