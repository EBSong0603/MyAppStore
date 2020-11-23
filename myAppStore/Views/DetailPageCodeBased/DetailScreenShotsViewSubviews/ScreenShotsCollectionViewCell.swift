//  CapturedImageCollectionViewCell.swift
//  myAppStore
//  Created by 송은비 on 2020/10/19.
//  Copyright © 2020 EB. All rights reserved.

import UIKit

class ScreenShotsCollectionViewCell: BaseCollectionViewCell {
    
    static var identifier = ScreenShotsCollectionViewCell.identifierString
    
    private var capturedImage: UIImageView = {
        let imageView = UIImageView()
        imageView.setImageViewStyle(UIImage(named: "DearMeAppIcon")!, radius: 10, contentMode: .scaleAspectFill)
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5).cgColor
        return imageView  
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(with cellData: String) {
        let screenShotsUrl = cellData
        ImageCacheManager.load(with: screenShotsUrl, imageView: capturedImage)
    }
    
    override func configureAutolayouts() {
        contentView.addSubview(capturedImage)
        
        capturedImage.top(contentView.topAnchor)
        capturedImage.leading(contentView.leadingAnchor)
        capturedImage.trailing(contentView.trailingAnchor)
        capturedImage.bottom(contentView.bottomAnchor)
    }
}
