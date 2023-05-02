//
//  StandardPicker.swift
//  PlayGroundApp
//
//  Created by Ramazan Öğünç on 1.05.2023.
//

import UIKit
import TinyConstraints

protocol StandardPickerDelegate : AnyObject {
    func didSelect(option: String)
}

class StandardPicker: UIView {
    
    weak var delegate: StandardPickerDelegate?
    
    
    let picker: UIPickerView = UIPickerView()
    
    let btnSelect: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Select", for: .normal)
        btn.addTarget(self, action: #selector(clickSelect), for: .touchUpInside)
        return btn
    }()
    
    
    let lblTitle: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = .boldSystemFont(ofSize: 20)
        lbl.text = "Select"
        lbl.textAlignment = .center
        return lbl
    }()
    
    
    let btnCancel: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Cancel", for: .normal)
        btn.tintColor = .red
        btn.addTarget(self, action: #selector(clickCancel), for: .touchUpInside)
        return btn
    }()
    
    
    var data : [String] = [] {
        didSet {
            self.picker.reloadAllComponents()
        }
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit() {
       backgroundColor = .white
       setupViews()
       self.picker.dataSource = self
       self.picker.delegate = self
    }
    
    @objc private func clickSelect() {
        let index = picker.selectedRow(inComponent: 0)
        let data = self.data[index]
        delegate?.didSelect(option: data)
        removeFromSuperview()
    }
    
    @objc private func clickCancel() {
        removeFromSuperview()
        
    }
    
    private func setupViews(){
        addSubview(btnCancel)
        btnCancel.leadingToSuperview(offset: 10)
        btnCancel.topToSuperview(offset: 10)
        
        addSubview(lblTitle)
        lblTitle.topToSuperview(offset: 15)
        lblTitle.leadingToSuperview(offset: 30)
        lblTitle.trailingToSuperview(offset: 30)
        
        addSubview(btnSelect)
        btnSelect.trailingToSuperview(offset: 10)
        btnSelect.topToSuperview(offset: 10)
        
        
        addSubview(picker)
        picker.topToBottom(of: btnCancel, offset: 10)
        picker.bottomToSuperview()
        picker.leadingToSuperview()
        picker.trailingToSuperview()
        
    }
    

}


extension StandardPicker : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
    
    
}
