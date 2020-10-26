//
//  UILabel+Extension.swift
//  myAppStore
//
//  Created by 송은비 on 2020/10/21.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit

extension UILabel {
    
    func setStyle(_ text: String,
                  textColor: UIColor,
                  font: UIFont,
                  textAlignment: NSTextAlignment = .left) { 
        self.text = text
        self.textColor = textColor
        self.font = font
        self.textAlignment = textAlignment
    }
}
