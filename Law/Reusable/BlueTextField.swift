//
//  BlueTextField.swift
//  Law
//
//  Created by Adilet on 15/6/23.
//

import UIKit

class BlueTextField: UITextField {
    var forPlaceHolder = ""
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 57/255, green: 130/255, blue: 191/255, alpha: 1)
        
        font = .systemFont(ofSize: 15)
//        tintColor = .white
        textColor = .white
        layer.cornerRadius = 20
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
