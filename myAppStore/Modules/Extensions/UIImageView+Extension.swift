//  UIImageView+Extension.swift
//  myAppStore
//  Created by 송은비 on 2020/10/21.
//  Copyright © 2020 EB. All rights reserved.

import UIKit

extension UIImageView {
    
    func setImageViewStyle(_ image: UIImage?,
                           radius: CGFloat = 0,
                           tintColor: UIColor = .clear,
                           contentMode: UIView.ContentMode = .scaleAspectFill) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
        self.tintColor = tintColor
        self.contentMode = contentMode
        self.image = image
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5).cgColor
    }
}



