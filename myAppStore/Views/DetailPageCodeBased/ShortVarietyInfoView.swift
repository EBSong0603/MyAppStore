//  SecondShortInformView.swift
//  myAppStore
//  Created by 송은비 on 2020/10/17.
//  Copyright © 2020 EB. All rights reserved.

import UIKit

class ShortVarietyInfoView: ModuleView, UIScrollViewDelegate {
    
    private let varietyInfoItems = ShortInformationItems()
    
    private let scrollView: UIScrollView = UIScrollView()
    
    private let hStackView = UIStackView().style(axis: .horizontal, spacing: 10, distribution: .fillProportionally)
    
    private let ratingVStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.setStackViewStyle(axis: .vertical, spacing: 2, distribution: .fillEqually)
        stackView.alignment = .center
        
        return stackView
    }()
    
    private let developerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.crop.square")
        imageView.tintColor = .gray
        return imageView
    }()
    
    private let DetailViewRatingStarView = BasicRatingStarView(starStyle: .large, count: 5)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        scrollView.delegate = self
        scrollView.showsHorizontalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setItems(with item: InfoItems) {
        
    }
    
    func setData(with data: AppStoreModel.ResultsEntry) {
        
        DetailViewRatingStarView.setData(with: data)
        varietyInfoItems.setData(with: data)
        
        for item in varietyInfoItems.items {
            
            let separator = VerticalSeperatorView()
            let vStackView = UIStackView()
            vStackView.setStackViewStyle(axis: .vertical, spacing: 2, distribution: .fillEqually)
            vStackView.alignment = .center
            vStackView.height(70)
            vStackView.width(100)
            
            let topInfoLabel = BasicComponentLabel(labelStyle: .system12SB)
            topInfoLabel.setStyle(title: "연령", color: .lightGray, alignment: .center)
            let middleInfoLabel = BasicComponentLabel(labelStyle: .arial20)
            middleInfoLabel.setStyle(title: "4+", color: .gray, alignment: .center)

            let bottomInfoLabel = BasicComponentLabel(labelStyle: .system12)
            bottomInfoLabel.setStyle(title: "세", color: .gray, alignment: .center)
            
            topInfoLabel.text = item.topLabelText
            middleInfoLabel.text = item.middelLabelText
            bottomInfoLabel.text = item.bottomLabelText
            
            if item.middelLabelText == nil, item.onImage == true {
                
                vStackView.addArrangedSubviews([topInfoLabel, developerImageView, bottomInfoLabel])
                hStackView.addArrangedSubview(vStackView)
                hStackView.addArrangedSubview(separator)
                
            } else if item.bottomLabelText == nil, item.onRatingStarView == true {
                
                vStackView.addArrangedSubviews([topInfoLabel, middleInfoLabel, DetailViewRatingStarView])
                hStackView.addArrangedSubview(vStackView)
                hStackView.addArrangedSubview(separator)
            } else {
                if item.topLabelText == "언어" {
                    vStackView.addArrangedSubviews([topInfoLabel, middleInfoLabel, bottomInfoLabel])
                    hStackView.addArrangedSubview(vStackView)
                } else {
                vStackView.addArrangedSubviews([topInfoLabel, middleInfoLabel, bottomInfoLabel])
                hStackView.addArrangedSubview(vStackView)
                hStackView.addArrangedSubview(separator)
                }
            }
        }
    }
    
    override func configureAutolayouts() {
        
        self.addSubview(scrollView)
        scrollView.addSubview(hStackView)
        
        scrollView.edges(self, vConstant: 0, hConstant: 16)
        hStackView.top(scrollView.contentLayoutGuide.topAnchor)
        hStackView.leading(scrollView.contentLayoutGuide.leadingAnchor)
        hStackView.trailing(scrollView.contentLayoutGuide.trailingAnchor)
        hStackView.bottom(scrollView.contentLayoutGuide.bottomAnchor)
        hStackView.heightDemension(scrollView.frameLayoutGuide.heightAnchor)
    }
}
