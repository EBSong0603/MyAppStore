//
//  UIButton+Extension.swift
//  myAppStore
//
//  Created by 송은비 on 2020/10/20.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit

extension UIButton {
    func setTitleButtonStyle(_ title: String,
                             font: UIFont,
                             tintColor: UIColor,
                             backgroundColor: UIColor,
                             radius: CGFloat = 0) {
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = font
        self.setTitleColor(tintColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    //contentEdgeImsets는 컨텐츠의 엣지를 관장함 - > UIEdgeInsets 확인
    func setInsets(vertical: CGFloat, horizonal: CGFloat) {
        self.contentEdgeInsets = UIEdgeInsets(top: vertical,
                                              left: horizonal,
                                              bottom: vertical,
                                              right: horizonal)
    }
}
