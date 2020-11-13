//
//  BasicAppIconImageView.swift
//  myAppStore
//
//  Created by 송은비 on 2020/11/14.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit

class BasicAppIconImageView: UIImageView {
    
    enum AppIconStyle {
        case small
        case large
        var rawValue: (radius: CGFloat, width: CGFloat, height: CGFloat) {
        switch self {
        case .small: return (14, 60, 60)
        case .large: return (20, 110, 110)
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
        self.image = UIImage(named: "DearMeAppIcon")
        self.clipsToBounds = true
        self.layer.cornerRadius = style.rawValue.radius
        self.contentMode = .scaleAspectFill
        
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5).cgColor
        
        self.width(style.rawValue.width)
        self.height(style.rawValue.height)
    }
    
    //large
    private let appIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.setImageViewStyle(UIImage(named: "DearMeAppIcon")!, radius: 20, contentMode: .scaleAspectFill)
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5).cgColor
        return imageView
    }()

    //small
    private var appIconImageView2: UIImageView = {
        let imageView = UIImageView()
        imageView.setImageViewStyle(UIImage(named: "DearMeAppIcon")!,
                                    radius: 14, tintColor: .clear, contentMode: .scaleAspectFill)
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5).cgColor
        return imageView
    }()
    
}
