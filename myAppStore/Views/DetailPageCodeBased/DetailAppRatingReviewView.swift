//  DetailSixthView.swift
//  myAppStore
//  Created by 송은비 on 2020/10/30.
//  Copyright © 2020 EB. All rights reserved.

import UIKit

class DetailAppRatingReviewView: ModuleView {
    
    private let topView = RatingReviewTitleView()
    private let secondView = RatingReviewInfoView()
    private let thirdView = ReviewCountView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(with data: AppStoreModel.ResultsEntry) {
        secondView.setData(with: data)
        thirdView.setData(with: data)
    }
    
    override func configureAutolayouts() {
        
        self.addSubViews([topView, secondView, thirdView])
        topView.top(self.topAnchor)
        topView.leading(self.leadingAnchor)
        topView.trailing(self.trailingAnchor)
        
        secondView.top(topView.bottomAnchor, constant: 16)
        secondView.leading(topView.leadingAnchor)
        secondView.trailing(topView.trailingAnchor)
        
        thirdView.top(secondView.bottomAnchor,constant: 10)
        thirdView.leading(secondView.leadingAnchor)
        thirdView.trailing(secondView.trailingAnchor)
        thirdView.bottom(self.bottomAnchor)
    }
}
