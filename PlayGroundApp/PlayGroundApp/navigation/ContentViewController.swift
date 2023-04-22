//
//  ContentViewController.swift
//  on-boarding
//
//  Created by Ramazan Öğünç on 11.04.2023.
//

import Foundation
import UIKit

protocol ContentViewControllerProtocol {
    var delegate: SideMenuDelegate? { get set }
}

class ContentViewController: BaseViewController, ContentViewControllerProtocol {
    weak var delegate: SideMenuDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
  
    func configureRightMenu(_ barButtonImage: UIImage?) {
        let barButtonItem = UIBarButtonItem(image: barButtonImage, style: .plain, target: self, action: #selector(menuTapped))
        barButtonItem.tintColor = .black
        navigationItem.setRightBarButton(barButtonItem, animated: false)
    }

    @objc private func menuTapped() {
        delegate?.menuButtonTapped()
    }
}
