//
//  HomeViewController.swift
//  PlayGroundApp
//
//  Created by Ramazan Öğünç on 22.04.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let lbl : UILabel = {
        let lbl = UILabel()
        lbl.text = "Label Deneme"
        lbl.textColor = .black
        lbl.font = .boldSystemFont(ofSize: 20)
        return lbl
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(lbl)
        lbl.topToSuperview(usingSafeArea: true)
        lbl.leadingToSuperview(usingSafeArea: true)
        lbl.trailingToSuperview(usingSafeArea: true)
        
    }
    


}
