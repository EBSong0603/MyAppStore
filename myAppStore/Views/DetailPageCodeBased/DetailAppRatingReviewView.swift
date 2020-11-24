//  DetailSixthView.swift
//  myAppStore
//  Created by 송은비 on 2020/10/30.
//  Copyright © 2020 EB. All rights reserved.

import UIKit

class DetailAppRatingReviewView: ModuleView {
    
    private let averageRatingLabel: BasicComponentLabel = {
        let label = BasicComponentLabel(labelStyle: .arial50)
        label.setStyle(title: "5.0", color: .black)
        return label
    }()
    private let reviewStickView = RatingFiveStickView()
    private let reviewStarView = FullStarStackView()
    
    private let maxRatingLabel: BasicComponentLabel = {
        let label = BasicComponentLabel(labelStyle: .system12)
        label.setStyle(title: "5점 중", color: .gray)
        return label
    }()
    
    private let reviewIntLabel: BasicComponentLabel = {
        let label = BasicComponentLabel(labelStyle: .system12)
        label.setStyle(title: "2개의 평가", color: .gray)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(with data: AppStoreModel.ResultsEntry) {
        reviewIntLabel.text = "\(data.userRatingCount.Decimal(with: data.userRatingCount)) 개의 평가"

        averageRatingLabel.text = "\(data.averageUserRating)"

    }
    
    override func configureAutolayouts() {
        
        self.addSubViews([ averageRatingLabel, reviewStickView, reviewStarView, maxRatingLabel, reviewIntLabel])

        averageRatingLabel.top(self.topAnchor)
        averageRatingLabel.leading(self.leadingAnchor, constant: 16)
        
        reviewStickView.centerY(averageRatingLabel.centerYAnchor)
        reviewStickView.trailing(self.trailingAnchor, constant: -16)
        reviewStarView.trailing(reviewStickView.leadingAnchor, constant: -10)
        reviewStarView.centerY(reviewStickView.centerYAnchor)

        maxRatingLabel.top(averageRatingLabel.bottomAnchor, constant: 10)
        maxRatingLabel.leading(self.leadingAnchor, constant: 35)
        maxRatingLabel.trailing(self.trailingAnchor)
        maxRatingLabel.bottom(self.bottomAnchor, constant: -20)
        
        
        
        reviewIntLabel.centerY(maxRatingLabel.centerYAnchor)
        reviewIntLabel.trailing(self.trailingAnchor, constant: -16)
    }
}
