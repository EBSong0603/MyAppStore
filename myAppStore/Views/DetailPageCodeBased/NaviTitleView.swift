//  NaviTitleView.swift
//  myAppStore
//  Created by 송은비 on 2020/11/12.
//  Copyright © 2020 EB. All rights reserved.

import UIKit

class NaviTitleView: ModuleView {
    
    private let naviAppIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.setImageViewStyle(nil, radius: 5, contentMode: .scaleAspectFill)
        imageView.contentMode = .scaleAspectFill
        imageView.size(30)
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

        let naviAppIconUrl: String = data.artworkUrl512
        ImageCacheManager.load(with: naviAppIconUrl, imageView: naviAppIconImageView)
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
