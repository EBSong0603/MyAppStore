//  ButtonPractice.swift
//  myAppStore
//  Created by 송은비 on 2020/11/04.
//  Copyright © 2020 EB. All rights reserved.

import UIKit

class BasicButton: UIButton {
    let mycolor = #colorLiteral(red: 0.8783541322, green: 0.8784807324, blue: 0.8783264756, alpha: 1)
    enum ButtonStyle {
        case blue
        case gray
        var rawValue: (title: String, backgroundColor: UIColor, titleColor: UIColor) {
        switch self {
        case .blue: return ("받기", .systemBlue, .white)
        case .gray: return ("받기", .systemGray5, .systemBlue)
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
        self.backgroundColor = style.rawValue.backgroundColor
        self.setTitleColor(style.rawValue.titleColor, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        self.layer.cornerRadius = 14
        self.width(70)
        self.height(28)
        self.setInsets(vertical: 5, horizonal: 16)
    }
    
}
