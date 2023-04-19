//
//  ContentViewController.swift
//  on-boarding
//
//  Created by Ramazan Öğünç on 11.04.2023.
//

import Foundation
import UIKit

class ContentViewController: BaseViewController {
    weak var delegate: SideMenuDelegate?
    var barButtonImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
  
    func configureLeftMenu(_ barButtonImage: UIImage?) {
        self.barButtonImage = barButtonImage
        let barButtonItem = UIBarButtonItem(image: barButtonImage, style: .plain, target: self, action: #selector(menuTapped))
        barButtonItem.tintColor = .black
        navigationItem.setLeftBarButton(barButtonItem, animated: false)
    }

    @objc private func menuTapped() {
        delegate?.menuButtonTapped()
    }
}
