//  StarRatingImageView.swift
//  myAppStore
//  Created by 송은비 on 2020/10/20.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class StarRatingImageView: ModuleView {
    
    private let starHStackView: UIStackView = {
        let hStackView = UIStackView()
        hStackView.setStackViewStyle(axis: .horizontal, spacing: 2, distribution: .fillProportionally)
        return hStackView
    }()
    private let fiveStarStackView = RatingStarStackView(starStyle: .middle, count: 5)
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.setStyle("", textColor: .gray, font: UIFont.systemFont(ofSize: 12), textAlignment: .left)
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        starHStackView.addArrangedSubviews([fiveStarStackView, ratingLabel])
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
        
        self.addSubview(starHStackView)
        starHStackView.top(self.topAnchor, constant: 0)
        starHStackView.leading(self.leadingAnchor, constant: 0)
        starHStackView.trailing(self.trailingAnchor, constant: 0)
        starHStackView.bottom(self.bottomAnchor, constant: 0) 
    }
}


