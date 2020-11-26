//  BasicComponentLabel.swift
//  myAppStore
//  Created by 송은비 on 2020/11/20.
//  Copyright © 2020 EB. All rights reserved.

import UIKit

class BasicComponentLabel: UILabel {
    
    enum LabelStyle {
        case system10
        case system12
        case system12SB
        case system15
        case system15B
        case system20
        case system20B
        case system20SB
        case arial20
        case arial50
        var rawValue: (UIFont) {
            switch self {
            case .system10: return UIFont.systemFont(ofSize: 10)
            case .system12: return UIFont.systemFont(ofSize: 12)
            case .system12SB: return UIFont.systemFont(ofSize: 12, weight: .semibold)
            case .system15: return UIFont.systemFont(ofSize: 15)
            case .system15B: return UIFont.systemFont(ofSize: 15, weight: .bold)
            case .system20: return UIFont.systemFont(ofSize: 20)
            case .system20B: return UIFont.systemFont(ofSize: 20, weight: .bold)
            case .system20SB: return UIFont.systemFont(ofSize: 20, weight: .semibold)
            case .arial20: return UIFont(name: "Arial Rounded MT Bold", size: 20)!
            case .arial50: return UIFont(name: "Arial Rounded MT Bold", size: 50)!
            }
        }
    }
    
    var style: LabelStyle
    
    init(labelStyle: LabelStyle) {
        self.style = labelStyle
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyle(title: String, color: UIColor, alignment: NSTextAlignment = .left) {
        self.text = title
        self.textColor = color
        self.textAlignment = alignment
        self.font = style.rawValue
    }
}
