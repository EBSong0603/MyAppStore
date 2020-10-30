//
//  RatingStarImageView.swift
//  myAppStore
//
//  Created by 송은비 on 2020/10/30.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit

class ratingStar: UIImageView {
    
    enum StarStyle {
         case smallStar
         case middleStar
         case largeStar
     }
  
    let style: StarStyle
    
    init(_ style: StarStyle) {
        self.style = style
        super.init(frame: .zero)
        setStyle(style)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyle(_ style: StarStyle) {
        var width: CGFloat = 10
        var height: CGFloat = 10
        var image: UIImage = UIImage(systemName: "star")!
    
        var tintColor: UIColor = .lightGray
        switch style {
        case .smallStar:
            image = UIImage(systemName: "star.fill")!
            width = 8
            height = 8
            tintColor = .gray
        case .middleStar:
            image = UIImage(systemName: "star.fill")!
            width = 12
            height = 12
            tintColor = .gray
        case .largeStar:
            image = UIImage(systemName: "star.fill")!
            width = 15
            height = 15
            tintColor = .gray
        }
        self.image = image
        self.width(width)
        self.height(height)
        self.tintColor = tintColor
    
    }
    
    
    
}
