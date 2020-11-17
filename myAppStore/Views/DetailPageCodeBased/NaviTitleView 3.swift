//
//  NaviTitleView.swift
//  myAppStore
//
//  Created by 송은비 on 2020/11/12.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit

class NaviTitleView: ModuleView {
    
    private let naviAppIconImageView: UIImageView = {
          let imageView = UIImageView()
          imageView.setImageViewStyle(UIImage(named: "DearMeAppIcon")!, radius: 5, contentMode: .scaleAspectFill)
     imageView.width(30)
     imageView.height(30)
          return imageView
      }()
    
    private let inAppPurchaseLabel: UILabel = {
      let label = UILabel()
        label.setStyle("인앱결제", textColor: .lightGray, font: UIFont.systemFont(ofSize: 8))
        return label
    }()
    
    
    private let getButton: BasicGetButton = {
         let button = BasicGetButton(.lightGray)
         button.setStyle(.lightGray, title: "받기")
         button.setInsets(vertical: 5, horizonal: 16)
        button.width(70)
        button.height(28)
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
        self.addSubViews([naviAppIconImageView])
        naviAppIconImageView.centerY(self.centerYAnchor)
        naviAppIconImageView.centerX(self.centerXAnchor)
        
//        getButton.leading(naviAppIconImageView.trailingAnchor, constant: 70)
//        getButton.trailing(self.trailingAnchor, constant: -4)
//        getButton.centerY(naviAppIconImageView.centerYAnchor)
     
        
    }
}
