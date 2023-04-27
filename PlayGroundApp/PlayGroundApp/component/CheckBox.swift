//
//  CheckBox.swift
//  PlayGroundApp
//
//  Created by Ramazan Öğünç on 27.04.2023.
//

import UIKit

class CheckBox: UIButton {
    // Images
    private let checkedImage = UIImage(systemName: "checkmark.circle")
    private let uncheckedImage = UIImage(systemName: "circle")

    // Bool property
    var isChecked: Bool = false {
        didSet{
            if isChecked == true {
                self.setImage(checkedImage, for: .normal)
            } else {
                self.setImage(uncheckedImage, for: .normal)
            }
        }
    }
    
    var onChange: ((Bool) -> Void)? = nil
    
    convenience init() {
        self.init(type: .system)
        self.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }

    @objc func buttonClicked(_ sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
            onChange?(isChecked)
        }
    }
}
