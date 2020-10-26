//
//  BasicLabel.swift
//  myAppStore
//
//  Created by 송은비 on 2020/10/24.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit

class BasicLabel: UILabel {
    
    enum LabelStyle {
        case appTitle
        case subTitle
        case purchase
    }
    
    let style: LabelStyle
    
    init(_ style: LabelStyle) {
        self.style = style
        super.init(frame: .zero)
    }
    
 required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyle(_ style: LabelStyle, text: String = "") {
        var textColor: UIColor = .black
        var font: UIFont = .systemFont(ofSize: 16)
        switch style {
        case .appTitle:
            textColor = .black
            font = .systemFont(ofSize: 16)
        case .subTitle:
            textColor = .gray
            font = .systemFont(ofSize: 12)
        case .purchase:
            textColor = .black
            font = .systemFont(ofSize: 10)
        }
        self.textColor = textColor
        self.font = font
    }
}
