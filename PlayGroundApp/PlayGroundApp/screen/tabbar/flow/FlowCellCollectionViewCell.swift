//
//  FlowCellCollectionViewCell.swift
//  PlayGroundApp
//
//  Created by Ramazan Öğünç on 1.05.2023.
//

import UIKit
import TinyConstraints

class FlowCellCollectionViewCell: UICollectionViewCell {
    
    
    var data: Int? {
        didSet {
            guard let item = data else {return}
            txt.text = "\(item)"
            backgroundColor = item % 2 == 0 ? .blue : .orange
        }
    }
    
    
    let txt: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = .clear
        textView.font = .boldSystemFont(ofSize: 25)
        textView.textColor = .white
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Something went wrong")
    }

    
    private func setupViews() {
        layer.cornerRadius = 10
        layer.masksToBounds = true
        addSubview(txt)
        txt.centerInSuperview()
    }
    
    
}
