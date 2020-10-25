//
//  CapturedImageCollectionViewCell.swift
//  myAppStore
//
//  Created by 송은비 on 2020/10/19.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit

class CapturedImageCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CapturedImageCollectionViewCell"
    private var capturedImage: UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "DearMeAppIcon")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
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
        capturedImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            capturedImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            capturedImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            capturedImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            capturedImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
