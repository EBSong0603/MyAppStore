//  GetBasicButton.swift
//  myAppStore
//  Created by 송은비 on 2020/10/21.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class BasicGetButton: UIButton {

    enum ButtonStyle {
        case blue
        case lightGray
    }
    
    let style: ButtonStyle
    
    init(_ style: ButtonStyle) {
        self.style = style
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setStyle(_ style: ButtonStyle, title: String? = "") {
        var backgroundColor: UIColor = .clear
        var titlecolor: UIColor = .clear
        
        switch style {
        case .blue:
            backgroundColor = .systemBlue
            titlecolor = .white
        case .lightGray:
            let mycolor = #colorLiteral(red: 0.877914816, green: 0.877914816, blue: 0.877914816, alpha: 1)
            backgroundColor = mycolor
            titlecolor = .systemBlue
        }
        
        self.setTitleColor(titlecolor, for: .normal)
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = 14.5
    }
    
    override var isHighlighted: Bool {
        didSet {
            setHightlighted(isHighlighted)
        }
    }
    
    func setHightlighted(_ isHi: Bool) {
        var backgroundColor: UIColor = .clear
        switch style {
        case .blue:
            backgroundColor = isHighlighted ? .lightGray : .systemBlue
        case .lightGray:
            backgroundColor = isHighlighted ? .systemBlue : .lightGray
        }
        self.backgroundColor = backgroundColor
    }
}
