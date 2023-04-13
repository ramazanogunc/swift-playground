//
//  SliderCell.swift
//  PlayGroundApp
//
//  Created by Ramazan Öğünç on 13.04.2023.
//

import UIKit
import TinyConstraints

class SliderCell: UICollectionViewCell {
    
    private let image : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    
    let txtDesc: UITextView = {
        let textView = UITextView()
        //textView.text = "Ailemizin Arama Motoru Google"
        //textView.font = UIFont.boldSystemFont (ofSize: 18)
        let attrText = NSMutableAttributedString(string: "Ailemizin Arama Motoru Google\n\n", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        attrText.append(NSAttributedString(string: "Internet aramasa, gevrin ipi bilgi dagitami, reklam teknolojileri ve arame motoriara için yetirimler yapon cok uluslu Amerikan anonin sirketidir, internet tabania hirmot us ûrüaler gelistirir.", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)/*, NSAttributedString.Key.foregroundColor: Color.darkGray*/]))
        textView.attributedText = attrText
        
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
        image.heightToSuperview(multiplier: 0.6)
        
        
        addSubview(txtDesc)
        
        txtDesc.topToBottom(of: imgContainer, offset: 10)
        txtDesc.leadingToSuperview(offset: 30)
        txtDesc.trailingToSuperview(offset: 30)
        
    }
    
    
}
