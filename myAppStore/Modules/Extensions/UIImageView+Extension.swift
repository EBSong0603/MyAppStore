//  UIImageView+Extension.swift
//  myAppStore
//  Created by 송은비 on 2020/10/21.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

extension UIImageView {
    
    func load(with url: String) {
        
        let cacheKey = NSString(string: url)
        if let cachedImage = ImageCacheManager.useCache.object(forKey: cacheKey) {
            self.image = cachedImage
            return
        }
        guard let imageURL = URL(string: url) else {return}
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else {return}
            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.image = image
                if let image = image {
                    ImageCacheManager.useCache.setObject(image, forKey: cacheKey)
                }
            }
        }
    }
    
    func setImageViewStyle(_ image: UIImage,
                           radius: CGFloat = 0,
                           tintColor: UIColor = .clear,
                           contentMode: UIView.ContentMode = .scaleAspectFill) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
        self.tintColor = tintColor
        self.contentMode = contentMode
        self.image = image 
    }
    
    func starImageView(_ image: UIImage = UIImage(systemName: "star")!, tintcolor: UIColor = .gray, width: CGFloat = 8, height: CGFloat = 8) {
        self.width(width)
        self.height(height)
        self.tintColor = tintcolor
        self.image = UIImage(systemName: "star.fill")
    }
}



