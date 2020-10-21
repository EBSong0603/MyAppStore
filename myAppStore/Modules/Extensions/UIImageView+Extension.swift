//
//  UIImageView+Extension.swift
//  myAppStore
//
//  Created by 송은비 on 2020/10/21.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func load(with url: String) {
        guard let imageURL = URL(string: url) else {return}
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else {return}
            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}

