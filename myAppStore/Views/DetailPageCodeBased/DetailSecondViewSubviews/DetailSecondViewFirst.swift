//
//  DetailSecondViews.swift
//  myAppStore
//
//  Created by 송은비 on 2020/10/28.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit

class DetailSecondViewFirst: ModuleView {
    
    private let ratingVStackView = UIStackView().style(axis: .vertical, spacing: 0, distribution: .fillEqually)

    private let ratingIntLabel: UILabel = {
         let label = UILabel()
        label.setStyle("5.0", textColor: .gray, font: UIFont.systemFont(ofSize: 20), textAlignment: .center)
         return label
     }()
    
     private let reviewCountLabel: UILabel = {
         let label = UILabel()
        label.setStyle("256 개의 평가", textColor: .lightGray, font: UIFont.systemFont(ofSize: 14), textAlignment: .center)
         return label
     }()

     private let ratingView = DetailStarRatingViewSecond()
        

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.width(150)

        ratingVStackView.addArrangedSubviews([reviewCountLabel, ratingIntLabel, ratingView])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func setData(with data: AppStoreModel.ResultsEntry) {
         let userRC: String = data.userRatingCount.formatPoints(from: data.userRatingCount)
        reviewCountLabel.text = "\(userRC) 개의 리뷰"
        
        ratingIntLabel.text = "\(Double(data.averageUserRating))"
    }
    
    override func configureAutolayouts() {

        self.addSubview(ratingVStackView)
        ratingVStackView.edges(self)

        
    }


}
