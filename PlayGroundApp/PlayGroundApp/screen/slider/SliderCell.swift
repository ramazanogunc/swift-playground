//
//  SliderCell.swift
//  PlayGroundApp
//
//  Created by Ramazan Öğünç on 13.04.2023.
//

import UIKit
import TinyConstraints
import Kingfisher

class SliderCell: UICollectionViewCell {
    
    
    var data: Slider? {
        didSet {
            guard let item = data else {return}
            image.kf.setImage(with:  URL(string: item.imageUrl))
            
            let attrText = NSMutableAttributedString(string: "\(item.title)\n\n", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
            attrText.append(NSAttributedString(string: item.description, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)/*, NSAttributedString.Key.foregroundColor: Color.darkGray*/]))
            txtDesc.attributedText = attrText
            txtDesc.textAlignment = .center
        }
    }
    
    private let image : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    
    let txtDesc: UITextView = {
        let textView = UITextView()
        textView.textAlignment = .center
        //taklayinca klavya golmesini engellemo
        textView.isEditable = false
        textView.isScrollEnabled = false
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
        let imgContainer = UIView()
        addSubview(imgContainer)
        imgContainer.leadingToSuperview()
        imgContainer.trailingToSuperview()
        imgContainer.topToSuperview(usingSafeArea: true)
        imgContainer.heightToSuperview(multiplier: 0.5)
        imgContainer.widthToSuperview()
        
        imgContainer.addSubview(image)
        image.centerInSuperview()
        image.heightToSuperview(multiplier: 0.4)
        
        
        addSubview(txtDesc)
        
        txtDesc.topToBottom(of: imgContainer, offset: 10)
        txtDesc.leadingToSuperview(offset: 30)
        txtDesc.trailingToSuperview(offset: 30)
        
    }
    
    
}
