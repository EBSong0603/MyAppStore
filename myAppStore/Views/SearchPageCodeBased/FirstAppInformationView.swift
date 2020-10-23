//  File.swift
//  myAppStore
//  Created by 송은비 on 2020/10/17.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class FirstAppInformationView: UIView {
    
    var isGameEnabled: Bool = false
    
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
    
    private let appNameLabel: UILabel = {
        let label = UILabel()
        label.setStyle("앱이름", textColor: .black,
                       font: UIFont.systemFont(ofSize: 16), textAlignment: .left)
        return label
    }()
    
    private let appCategoryLabel: UILabel = {
        let label = UILabel()
                label.setStyle("카테고리", textColor: .gray,
                               font: UIFont.systemFont(ofSize: 12), textAlignment: .left)
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
    
    private let appPurchaseLabel: UILabel = {
        
        let label = UILabel()
        label.setStyle("앱내구입", textColor: .black,
                       font: UIFont.systemFont(ofSize: 10), textAlignment: .center)
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
        starRatingView.setData(with: data)
    
        
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
