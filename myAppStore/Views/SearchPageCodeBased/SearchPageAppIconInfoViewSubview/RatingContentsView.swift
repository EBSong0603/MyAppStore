//  StarRatingImageView.swift
//  myAppStore
//  Created by 송은비 on 2020/10/20.
//  Copyright © 2020 EB. All rights reserved.

import UIKit

class RatingContentsView: ModuleView {
    
    private let ratingContentsHStackView: UIStackView = {
        let hStackView = UIStackView()
        hStackView.setStackViewStyle(axis: .horizontal, spacing: 2, distribution: .fillProportionally)
        return hStackView
    }()
    private let fiveStarStackView = BasicRatingStarView(starStyle: .middle, count: 5)
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.setStyle("", textColor: .gray, font: UIFont.systemFont(ofSize: 12), textAlignment: .left)
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        ratingContentsHStackView.addArrangedSubviews([fiveStarStackView, ratingLabel])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(with data: AppStoreModel.ResultsEntry) {
        
        fiveStarStackView.setData(with: data)
        let userRC: String = data.userRatingCount.formatPoints(from: data.userRatingCount)
        ratingLabel.text = userRC
    }
    
    override func configureAutolayouts() {
        
        self.addSubview(ratingContentsHStackView)
        ratingContentsHStackView.top(self.topAnchor, constant: 0)
        ratingContentsHStackView.leading(self.leadingAnchor, constant: 0)
        ratingContentsHStackView.trailing(self.trailingAnchor, constant: 0)
        ratingContentsHStackView.bottom(self.bottomAnchor, constant: 0) 
    }
}


