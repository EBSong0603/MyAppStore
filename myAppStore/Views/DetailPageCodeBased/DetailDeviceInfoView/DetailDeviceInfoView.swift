//  DetailThirdViewPhoneView.swift
//  myAppStore
//  Created by 송은비 on 2020/10/28.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class DetailDeviceInfoView: ModuleView {
    
    private let phoneImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.setImageViewStyle(UIImage(systemName: "iphone")!, tintColor: .black, contentMode: .scaleAspectFill)
        imageView.height(13)
        imageView.width(13)
        return imageView
    }()
    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.setStyle("iPhone", textColor: .gray, font: UIFont.systemFont(ofSize: 14))
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureAutolayouts() {
        self.addSubview(phoneImageView)
        self.addSubview(phoneLabel)
        
        phoneImageView.top(self.topAnchor)
        phoneImageView.leading(self.leadingAnchor, constant: 16)
        phoneImageView.bottom(self.bottomAnchor, constant: -20)
        phoneLabel.top(self.topAnchor)
        phoneLabel.leading(phoneImageView.trailingAnchor, constant: 8)
        phoneLabel.bottom(self.bottomAnchor, constant: -15)
        phoneLabel.trailing(self.trailingAnchor)
    }
}
