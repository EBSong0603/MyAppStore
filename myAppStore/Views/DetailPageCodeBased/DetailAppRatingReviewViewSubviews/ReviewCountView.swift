//  DetailSixthViewThird.swift
//  myAppStore
//  Created by 송은비 on 2020/10/30.
//  Copyright © 2020 EB. All rights reserved.

import UIKit

class ReviewCountView: ModuleView {
    
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
    }
    
    override func configureAutolayouts() {
        
        self.addSubViews([maxRatingLabel, reviewIntLabel])
        maxRatingLabel.top(self.topAnchor)
        maxRatingLabel.leading(self.leadingAnchor, constant: 35)
        maxRatingLabel.bottom(self.bottomAnchor, constant: -20)
        
        reviewIntLabel.centerY(maxRatingLabel.centerYAnchor)
        reviewIntLabel.trailing(self.trailingAnchor, constant: -16)
    }
}
