//
//  SliderCell.swift
//  PlayGroundApp
//
//  Created by Ramazan Öğünç on 13.04.2023.
//

import UIKit
import TinyConstraints
import Kingfisher


protocol TodoCellDelegate : AnyObject {
    func didChangeCompleted(todo: Todo, isCompleted: Bool)
}

class TodoCell: UICollectionViewCell {
    
    weak var delegate: TodoCellDelegate?
    
    
    var data: Todo? {
        didSet {
            guard let item = data else {return}
           
            txtName.textAlignment = .left
            txtName.text = item.name
            checkBox.isChecked = item.isCompleted
            
        }
    }

    
    private lazy var checkBox: CheckBox = {
        let cb = CheckBox()
        cb.isChecked = false
        cb.backgroundColor = .white
        cb.onChange = { isChecked in
            guard let data = self.data else { return }
            self.delegate?.didChangeCompleted(todo: data, isCompleted: isChecked)
        }
        return cb
    }()
    
    
    private let txtName: UITextView = {
        let textView = UITextView()
        textView.textAlignment = .center
        //taklayinca klavya golmesini engellemo
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.font = .systemFont(ofSize: 20)
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
        addSubview(checkBox)
        
        checkBox.leadingToSuperview()
        checkBox.topToSuperview()
        checkBox.bottomToSuperview()
        checkBox.width(50)
        
        addSubview(txtName)
        txtName.topToSuperview()
        txtName.leadingToTrailing(of: checkBox)
        txtName.trailingToSuperview()
        txtName.bottomToSuperview()
        
    }
    
    
}
