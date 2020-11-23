//  DetailSecondViews.swift
//  myAppStore
//  Created by 송은비 on 2020/10/28.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class ShortReviewView: ModuleView {
    
    private let ratingVStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.setStackViewStyle(axis: .vertical, spacing: 2, distribution: .fillEqually)
        stackView.alignment = .center
        
        return stackView
    }()
    private let ratingIntLabel: BasicComponentLabel = {
        let label = BasicComponentLabel(labelStyle: .arial20)
        label.setStyle(title: "5.0", color: .gray, alignment: .center)
        return label
    }()
    private let reviewCountLabel: BasicComponentLabel = {
        let label = BasicComponentLabel(labelStyle: .system12SB)
        label.setStyle(title: "256개의 평가", color: .lightGray, alignment: .center)
        return label
    }()
    private let DetailViewRatingStarView = BasicRatingStarView(starStyle: .large, count: 5)
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        self.height(70)
        self.width(100)
        ratingVStackView.addArrangedSubviews([reviewCountLabel, ratingIntLabel, DetailViewRatingStarView])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(with data: AppStoreModel.ResultsEntry) {
        
         let userRC: String = data.userRatingCount.formatPoints(from: data.userRatingCount)
        reviewCountLabel.text = "\(userRC) 개의 평가"
        ratingIntLabel.text = "\(data.averageUserRating)"
        DetailViewRatingStarView.setData(with: data)
    }
    
    override func configureAutolayouts() {

        self.addSubview(ratingVStackView)
        ratingVStackView.edges(self)
    }
}
