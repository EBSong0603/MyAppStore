//  NaviTitleView.swift
//  myAppStore
//  Created by 송은비 on 2020/11/12.
//  Copyright © 2020 EB. All rights reserved.

import UIKit

class NaviTitleView: ModuleView {
    
    private let naviAppIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.setImageViewStyle(UIImage(named: "DearMeAppIcon")!, radius: 5, contentMode: .scaleAspectFill)
        imageView.width(30)
        imageView.height(30)
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5).cgColor
        return imageView
    }()
    
    private let inAppPurchaseLabel: UILabel = {
        let label = UILabel()
        label.setStyle("인앱결제", textColor: .lightGray, font: UIFont.systemFont(ofSize: 8))
        return label
    }()
    
    private let getButton: BasicButton = {
        let button = BasicButton(buttonStyle: .blue)
        
        button.setStyle(title: "받기")
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(with data: AppStoreModel.ResultsEntry) {
        naviAppIconImageView.load(with: data.artworkUrl512)
    }
    
    override func configureAutolayouts() {
        
        let ratio: CGFloat = (UIScreen.main.bounds.width / 375)
        self.addSubViews([naviAppIconImageView, getButton])
        naviAppIconImageView.centerY(self.centerYAnchor)
        naviAppIconImageView.centerX(self.centerXAnchor)
        
        getButton.leading(naviAppIconImageView.trailingAnchor, constant: 90 * ratio)
        getButton.centerY(naviAppIconImageView.centerYAnchor)
    }
}
