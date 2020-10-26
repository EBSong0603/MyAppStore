//  CapturedImageCollectionViewCell.swift
//  myAppStore
//  Created by 송은비 on 2020/10/19.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class CapturedImageCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CapturedImageCollectionViewCell"
    
    private var capturedImage: UIImageView = {
        let imageView = UIImageView()
        imageView.setImageViewStyle(UIImage(named: "DearMeAppIcon")!, radius: 10, contentMode: .scaleAspectFill)
        return imageView  
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureAutoLayouts()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
   
    func setData(with cellData: String) {
        self.capturedImage.load(with: cellData)
    }
    
    private func configureAutoLayouts() {
        contentView.addSubview(capturedImage)
 
        capturedImage.top(contentView.topAnchor)
        capturedImage.leading(contentView.leadingAnchor)
        capturedImage.trailing(contentView.trailingAnchor)
        capturedImage.bottom(contentView.bottomAnchor)
    }
}
