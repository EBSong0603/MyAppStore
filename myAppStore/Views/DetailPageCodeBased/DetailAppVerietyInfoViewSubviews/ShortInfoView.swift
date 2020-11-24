//  DetailSecondViews.swift
//  myAppStore
//  Created by 송은비 on 2020/10/28.
//  Copyright © 2020 EB. All rights reserved.

import UIKit

class ShortInfoView: ModuleView {
    
    private let ratingVStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.setStackViewStyle(axis: .vertical, spacing: 2, distribution: .fillEqually)
        stackView.alignment = .center
        
        return stackView
    }()
    private let topInfoLabel: BasicComponentLabel = {
        let label = BasicComponentLabel(labelStyle: .system12SB)
        label.setStyle(title: "연령", color: .lightGray, alignment: .center)
        return label
    }()
    private let middleInfoLabel: BasicComponentLabel = {
        let label = BasicComponentLabel(labelStyle: .arial20)
        label.setStyle(title: "5.0", color: .gray, alignment: .center)
        return label
    }()
    private let bottonInfoLabel: BasicComponentLabel = {
        let label = BasicComponentLabel(labelStyle: .system12SB)
        label.setStyle(title: "256개의 평가", color: .lightGray, alignment: .center)
        return label
    }()
    
    private let developerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.crop.square")
        imageView.tintColor = .gray
        return imageView
    }()
    
    private let DetailViewRatingStarView = BasicRatingStarView(starStyle: .large, count: 5)
    
    init(with item: InfoItems) {
        super.init(frame: .zero)
        
        self.backgroundColor = .white
        self.height(70)
        self.width(100)
        
        set(with: item)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func set(with item: InfoItems) {
        topInfoLabel.text = item.topLabelText
        
        middleInfoLabel.text = item.middelLabelText
        bottonInfoLabel.text = item.bottomLabelText
        
        if item.middelLabelText == nil, item.onImage == true {
            ratingVStackView.addArrangedSubviews([topInfoLabel, developerImageView, bottonInfoLabel])
        } else if item.bottomLabelText == nil, item.onRatingStarView == true {
            ratingVStackView.addArrangedSubviews([topInfoLabel, middleInfoLabel, DetailViewRatingStarView])
        } else {
            ratingVStackView.addArrangedSubviews([topInfoLabel, middleInfoLabel, bottonInfoLabel])
        }
    }
    
    func setData(with data: AppStoreModel.ResultsEntry) {
        
        DetailViewRatingStarView.setData(with: data)
    }
    
    override func configureAutolayouts() {
        
        self.addSubview(ratingVStackView)
        ratingVStackView.edges(self)
    }
}
