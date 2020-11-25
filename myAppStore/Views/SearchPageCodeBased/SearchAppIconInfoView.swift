//  File.swift
//  myAppStore
//  Created by 송은비 on 2020/10/17.
//  Copyright © 2020 EB. All rights reserved.

import UIKit

class SearchAppIconInfoView: ModuleView {
    
    var isGame: Bool = false
    
    private var appIconImageView: BasicAppIconImageView = {
        let imageView = BasicAppIconImageView(appIconStyle: .small)
        imageView.setStyle()
        return imageView
    }()

    private let appContentsStackView = UIStackView().style(axis: .vertical, spacing: 0, distribution: .fillEqually)
    private let appNameLabel: BasicComponentLabel = {
        let label = BasicComponentLabel(labelStyle: .system15)
        label.setStyle(title: "앱이름", color: .black)
        return label
    }()
    private let appCategoryLabel: BasicComponentLabel = {
        let label = BasicComponentLabel(labelStyle: .system12)
        label.setStyle(title: "카테고리", color: .gray)
        return label
    }()
    
    private let starRatingView: BasicRatingStarView = BasicRatingStarView(starStyle: .middle, count: 5)

    private let reviewCountLabel: BasicComponentLabel = {
        let label = BasicComponentLabel(labelStyle: .system12)
        label.setStyle(title: "100개", color: .gray)
        return label
    }()
    
    private let downLoadButton: BasicButton = {
        let button = BasicButton(buttonStyle: .gray)
        button.setStyle(title: "받기")
        return button
    }()
    
    private let appPurchaseLabel: BasicComponentLabel = {
        let label = BasicComponentLabel(labelStyle: .system10)
        label.setStyle(title: "앱내구입", color: .black)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        appContentsStackView.addArrangedSubviews([appNameLabel, appCategoryLabel])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setData(with data: AppStoreModel.ResultsEntry?) {
        
        guard let data = data else {return}
        
        starRatingView.setData(with: data)
        appNameLabel.text = data.trackName
        appCategoryLabel.text = data.genres.joined(separator: ",")
        reviewCountLabel.text = data.userRatingCount.formatPoints(from: data.userRatingCount)
        
        let appIconUrl = data.artworkUrl512
        ImageCacheManager.load(with: appIconUrl, imageView: appIconImageView)
        appPurchaseLabel.isHidden = !data.isGameCenterEnabled
    }
    
    override func configureAutolayouts() {
        
        let ratio: CGFloat = (UIScreen.main.bounds.width / 375)
        
        self.addSubViews([appIconImageView, appContentsStackView, downLoadButton, appPurchaseLabel, reviewCountLabel, starRatingView])
        
        appIconImageView.top(self.topAnchor, constant: 16)
        appIconImageView.leading(self.leadingAnchor, constant: 16)
        appIconImageView.bottom(self.bottomAnchor, constant: -16)
        
        appContentsStackView.centerY(appIconImageView.centerYAnchor)
        appContentsStackView.leading(appIconImageView.trailingAnchor, constant: 8)
        appContentsStackView.width(200 * ratio)

        starRatingView.leading(appIconImageView.trailingAnchor, constant: 8)
        starRatingView.top(appContentsStackView.bottomAnchor)
        starRatingView.bottom(self.bottomAnchor)
        
        reviewCountLabel.leading(starRatingView.trailingAnchor, constant: 4)
        reviewCountLabel.centerY(starRatingView.centerYAnchor)

        downLoadButton.trailing(self.trailingAnchor, constant: -16)
        downLoadButton.centerY(self.centerYAnchor)
        
        appPurchaseLabel.top(downLoadButton.bottomAnchor, constant: 4)
        appPurchaseLabel.trailing(downLoadButton.trailingAnchor)
        appPurchaseLabel.leading(downLoadButton.leadingAnchor)
    }
}
