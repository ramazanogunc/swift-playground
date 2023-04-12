//
//  ContentViewController.swift
//  on-boarding
//
//  Created by Ramazan Öğünç on 11.04.2023.
//

import Foundation
import UIKit

class ContentViewController: UIViewController {
    weak var delegate: SideMenuDelegate?
    var barButtonImage: UIImage?
    
    convenience init(barButtonImage: UIImage?) {
        self.init()
        self.barButtonImage = barButtonImage
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
  
    private func configureView() {
        let barButtonItem = UIBarButtonItem(image: barButtonImage, style: .plain, target: self, action: #selector(menuTapped))
        barButtonItem.tintColor = .black
        navigationItem.setLeftBarButton(barButtonItem, animated: false)
    }

    @objc private func menuTapped() {
        delegate?.menuButtonTapped()
    }
}
