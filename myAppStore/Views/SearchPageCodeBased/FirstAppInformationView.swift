//  File.swift
//  myAppStore
//  Created by 송은비 on 2020/10/17.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class FirstAppInformationView: UIView {
    
    var isGame: Bool = false
    
    private var appIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.setImageViewStyle(UIImage(named: "DearMeAppIcon")!,
                                    radius: 14, tintColor: .clear, contentMode: .scaleAspectFill)
        return imageView
    }()
    
    //보통 스택뷰를 쓰면, 스택뷰 아래에 포함될 객체들 적어둠
    private let appContentsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.setStackViewStyle(axis: .vertical,
                                    spacing: 5, distribution: .fillEqually)
        return stackView
    }()
    
    private let appNameLabel: BasicLabel = {
        let label = BasicLabel(.appTitle)
        label.setStyle(.appTitle, text: "앱이름")
        return label
    }()
    
    private let appCategoryLabel: BasicLabel = {
        let label = BasicLabel(.subTitle)
        label.setStyle(.subTitle, text: "카테고리이름")
        return label
    }()
    
    private let starRatingView: StarRatingImageView = {
        let view = StarRatingImageView()
        return view
    }()
    
    private let downLoadButton: GetBasicButton = {
        let button = GetBasicButton(.lightGray)
        button.setStyle(.lightGray, title: "받기")
        button.setInsets(vertical: 5, horizonal: 16)
        return button
    }()
    
    private let appPurchaseLabel: BasicLabel = {
        
        let label = BasicLabel(.purchase)
        label.setStyle(.purchase, text: "앱내구입")
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        configureAutoLayouts()
        //UIStackView의 extension 함수 사용한 코드
        appContentsStackView.addArrangedSubviews([appNameLabel, appCategoryLabel, starRatingView])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setData(with data: AppStoreModel.ResultsEntry?) {
        
        guard let data = data else {return}
        starRatingView.setData(with: data)
        appNameLabel.text = data.trackName
        appCategoryLabel.text = data.genres.joined(separator: ",")
        
        let appIcon = data.artworkUrl512
        appIconImageView.load(with: appIcon)
        
        //다른식으로 표현가능함!!
        if data.isGameCenterEnabled == true {
            appPurchaseLabel.isHidden = false
        } else {
            appPurchaseLabel.isHidden = true
        }
    }
    
    private func configureAutoLayouts() {
        let ratio: CGFloat = (UIScreen.main.bounds.width / 375)
        
        self.addSubViews([appIconImageView, appContentsStackView, downLoadButton, appPurchaseLabel])
        
        appIconImageView.top(self.topAnchor, constant: 16)
        appIconImageView.leading(self.leadingAnchor, constant: 16)
        appIconImageView.bottom(self.bottomAnchor, constant: -16)
        appIconImageView.height(60)
        appIconImageView.width(60)
        
        appContentsStackView.centerY(appIconImageView.centerYAnchor)
        appContentsStackView.leading(appIconImageView.trailingAnchor, constant: 8)
        appContentsStackView.width(200 * ratio)

        downLoadButton.trailing(self.trailingAnchor, constant: -16)
        downLoadButton.centerY(self.centerYAnchor)
        downLoadButton.leading(appContentsStackView.trailingAnchor, constant: 16)
        
        appPurchaseLabel.top(downLoadButton.bottomAnchor, constant: 4)
        appPurchaseLabel.trailing(downLoadButton.trailingAnchor)
        appPurchaseLabel.leading(downLoadButton.leadingAnchor)
    }
}
