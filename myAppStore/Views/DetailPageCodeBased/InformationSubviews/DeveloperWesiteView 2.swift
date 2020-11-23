//
//  DeveloperWesiteView.swift
//  myAppStore
//
//  Created by 송은비 on 2020/11/13.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class DeveloperWebsiteView: ModuleView {
    
    private let developerLabel: UILabel = {
        let label = UILabel()
        label.setStyle("Developer Website", textColor: .systemBlue, font: UIFont.systemFont(ofSize: 12))
        return label
    }()
    
    private let compassImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.width(18)
        imageView.height(18)
        imageView.setImageViewStyle(UIImage(systemName: "safari")!)
        imageView.tintColor = .systemBlue
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureAutolayouts() {
        
        self.addSubViews([developerLabel, compassImageView])
        developerLabel.top(self.topAnchor)
        developerLabel.leading(self.leadingAnchor, constant: 16)
        developerLabel.bottom(self.bottomAnchor)
        
        compassImageView.centerY(developerLabel.centerYAnchor)
        compassImageView.trailing(self.trailingAnchor, constant: -16)
    }
}
