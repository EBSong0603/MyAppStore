//  RatingStarImageView.swift
//  myAppStore
//  Created by 송은비 on 2020/10/30.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class ratingStar: UIImageView {
    
    enum StarStyle {
         case smallStar
         case middleStarFill
        case middleStarEmpty
         case largeStarFill
        case largeStarEmpty
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
        case .middleStarFill:
            image = UIImage(systemName: "star.fill")!
            width = 12
            height = 12
            tintColor = .gray
        case .middleStarEmpty:
            image = UIImage(systemName: "star")!
            width = 12
            height = 12
            tintColor = .gray
        case .largeStarFill:
            image = UIImage(systemName: "star.fill")!
            width = 14
            height = 14
            tintColor = .lightGray   
        case .largeStarEmpty:
            image = UIImage(systemName: "star")!
            width = 14
            height = 14
            tintColor = .lightGray
        }
        self.image = image
        self.width(width)
        self.height(height)
        self.tintColor = tintColor
    }
}
