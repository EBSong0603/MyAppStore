//  UIImageView+Extension.swift
//  myAppStore
//  Created by 송은비 on 2020/10/21.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

extension UIImageView {
    
    func load(with url: String) {
        guard let imageURL = URL(string: url) else {return}
              //global과 main의 차이, global은 동시적으로 실행시키고, main은 순서에 따라 진행하게 함 그래서 global 로 했을땐 더 빠름
        //이미지 가져오는것은 꽤 무거운 작업이기에 global()로 하고 이미지를 유아이에 보여주는 작업은 가벼운 작업이기 때문에 main 으로 진행함
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else {return}
            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.image = image
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



