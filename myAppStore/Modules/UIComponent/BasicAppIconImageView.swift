//  BasicAppIconImageView.swift
//  myAppStore
//  Created by 송은비 on 2020/11/14.
//  Copyright © 2020 EB. All rights reserved.

import UIKit

class BasicAppIconImageView: UIImageView {
    
    enum AppIconStyle {
        case small
        case large
        var rawValue: (radius: CGFloat, size: CGFloat) {
        switch self {
        case .small: return (14, 60)
        case .large: return (20, 110)
        }
      }
    }
    
    var style: AppIconStyle
    
    init(appIconStyle: AppIconStyle) {
        self.style = appIconStyle
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyle() {

        self.setImageViewStyle(nil, radius: style.rawValue.radius, contentMode: .scaleAspectFill)
        self.size(style.rawValue.size)
    }
}
