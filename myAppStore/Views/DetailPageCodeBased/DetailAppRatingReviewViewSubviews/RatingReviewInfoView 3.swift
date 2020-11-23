//  DetauilSixthViewSecond.swift
//  myAppStore
//  Created by 송은비 on 2020/10/30.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class RatingReviewInfoView: ModuleView {
    
    private let reviewIntLabel: UILabel = {
        let label = UILabel()
        label.setStyle("5.0", textColor: .black, font: UIFont(name: "Arial Rounded MT Bold", size: 50)!)
        return label
    }()
    
    private let reviewStickView = RatingFiveStickView()
    private let reviewStarView = FullStarStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(with data: AppStoreModel.ResultsEntry) {
        reviewIntLabel.text = "\(data.averageUserRating)"
    }
    
    override func configureAutolayouts() {
        self.addSubViews([reviewIntLabel, reviewStarView, reviewStickView])
        
        reviewStickView.top(self.topAnchor)
        reviewStickView.trailing(self.trailingAnchor, constant: -16)
        reviewStickView.bottom(self.bottomAnchor)
        
        
        reviewStarView.trailing(reviewStickView.leadingAnchor, constant: -10)
        reviewStarView.leading(reviewIntLabel.trailingAnchor, constant: 16)
        
        reviewStarView.centerY(reviewIntLabel.centerYAnchor)
        reviewIntLabel.centerY(reviewStickView.centerYAnchor)
        reviewIntLabel.leading(self.leadingAnchor, constant: 16)
    }
}
