//
//  SliderViewController.swift
//  PlayGroundApp
//
//  Created by Ramazan Öğünç on 12.04.2023.
//

import UIKit
import TinyConstraints

class SliderViewController: ContentViewController {
    
    let label: UILabel = {
       let label = UILabel()
        label.text = "Deneme"
        label.textColor = .black
        return label
    }()

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
        
        view.addSubview(label)
        label.topToSuperview(usingSafeArea: true)
        label.leadingToSuperview()
    }
    
}

