//
//  CharacterCellTableViewCell.swift
//  PlayGroundApp
//
//  Created by Ramazan Öğünç on 22.04.2023.
//

import UIKit
import TinyConstraints


class CharacterCell: UITableViewCell {
    
    var data : Character? = nil {
        didSet {
            guard let data = self.data else { return }
            image.kf.setImage(with:  URL(string: data.image))
            lbl.text = data.name
        }
    }
    
    
    
    private let image : UIImageView = {
        let image = UIImageView()
        image.aspectRatio(1)
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 20
        image.width(100)
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let lbl: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = .boldSystemFont(ofSize: 18)
        lbl.text = "Deneme"
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        configureView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    private func configureView() {
        
        contentView.layer.masksToBounds = true
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10))
        contentView.directionalLayoutMargins = .init(top: 20, leading: 10, bottom: 0, trailing: 10)
        contentView.layoutMargins = .init(top: 20, left: 10, bottom: 0, right: 10)
        contentView.layer.cornerRadius = 20
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = .init(gray: 0.5, alpha: 0.5)
        
        contentView.addSubview(image)
        image.topToSuperview()
        image.leadingToSuperview()
        image.bottomToSuperview()
        contentView.addSubview(lbl)
        lbl.leadingToTrailing(of: image, offset: 20)
        lbl.topToSuperview(offset: 10)
        lbl.trailingToSuperview()
    }

}
