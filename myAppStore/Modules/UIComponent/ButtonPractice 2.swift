//
//  ButtonPractice.swift
//  myAppStore
//
//  Created by 송은비 on 2020/11/04.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit

class MyButton: UIButton {
    
    enum ButtonStyle {
        case blue
        case gray
        var rawValue: (title: String, backgroundColor: UIColor, titleColor: UIColor) {
        switch self {
        case .blue: return ("받기", .systemBlue, .white)
        case .gray: return ("받기", .lightGray, .systemBlue)
        }
    }
}
    var style: ButtonStyle
    
    init(buttonStyle: ButtonStyle) {
        self.style = buttonStyle
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyle(title: String) {
   
        self.setTitle(title, for: .normal)
//        self.setTitle(style.rawValue.title, for: .normal)
        self.backgroundColor = style.rawValue.backgroundColor
        self.setTitleColor(style.rawValue.titleColor, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        self.layer.cornerRadius = 14.5
      
    }
    
}
