//  ImageCacheManager.swift
//  myAppStore
//  Created by 송은비 on 2020/11/19.
//  Copyright © 2020 EB. All rights reserved.

import UIKit

class ImageCacheManager {
    
    static let nsCache = NSCache<NSString, UIImage>()
    
    static func load(with url: String, imageView: UIImageView) {
        let cacheKey = NSString(string: url)
        if let cachedImage = nsCache.object(forKey: cacheKey) {
            imageView.image = cachedImage
            return
        }
        guard let imageURL = URL(string: url) else {return}
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else {return }
            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                imageView.image = image
                if let image = image {
                    nsCache.setObject(image, forKey: cacheKey)
                }
            }
        }
    }
}
