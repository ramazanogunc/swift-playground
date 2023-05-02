//
//  CompositionCell.swift
//  PlayGroundApp
//
//  Created by Ramazan Öğünç on 2.05.2023.
//

import UIKit


class CompositionCell: UICollectionViewCell {
    
    var data: Int? {
        didSet {
            guard let item = data else {return}
        
            txtName.textAlignment = .center
            txtName.text = "\(item)"
            
            backgroundColor = item % 2 == 0 ? .blue : .orange
            
        }
    }
    
    private let txtName: UITextView = {
        let textView = UITextView()
        textView.textAlignment = .center
        //taklayinca klavya golmesini engellemo
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.font = .systemFont(ofSize: 20)
        textView.backgroundColor = .clear
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
        addSubview(txtName)
        txtName.centerInSuperview()
        
    }
    
    
}

