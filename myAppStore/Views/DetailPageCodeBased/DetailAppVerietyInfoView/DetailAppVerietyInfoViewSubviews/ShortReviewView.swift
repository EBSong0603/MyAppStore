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
    private let ratingIntLabel: UILabel = {
         let label = UILabel()
        label.setStyle("5.0", textColor: .gray, font: UIFont(name: "Arial Rounded MT Bold", size: 20)!, textAlignment: .center)
         return label
     }()
     private let reviewCountLabel: UILabel = {
         let label = UILabel()
        label.setStyle("256 개의 평가", textColor: .lightGray, font: UIFont.systemFont(ofSize: 12, weight: .semibold), textAlignment: .center)
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
        reviewCountLabel.text = "\(userRC) 개의 리뷰"
        ratingIntLabel.text = "\(data.averageUserRating)"
        DetailViewRatingStarView.setData(with: data)
    }
    
    override func configureAutolayouts() {

        self.addSubview(ratingVStackView)
        ratingVStackView.edges(self)
    }
}
