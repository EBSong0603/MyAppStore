//  RatingStarBarView.swift
//  myAppStore
//  Created by 송은비 on 2020/11/25.
//  Copyright © 2020 EB. All rights reserved.

import UIKit

class RatingStarBarView: ModuleView {
    
    private let ratingStarVStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.setStackViewStyle(axis: .vertical, spacing: 1, distribution: .fillEqually)
        stackView.alignment = .trailing
        return stackView
    }()
    
    private let ratingBarVStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.setStackViewStyle(axis: .vertical, spacing: 4, distribution: .fillEqually)
        stackView.alignment = .center
        return stackView
    }()
    
    private let fiveStarView = BasicRatingStarView(starStyle: .small, count: 5)
    private let fourStarView = BasicRatingStarView(starStyle: .small, count: 4)
    private let threeStarView = BasicRatingStarView(starStyle: .small, count: 3)
    private let twoStarView = BasicRatingStarView(starStyle: .small, count: 2)
    private let oneStarView = BasicRatingStarView(starStyle: .small, count: 1)
    
//    private let barImageView: UIImageView = {
//       let imageView = UIImageView()
//        imageView.width(180)
//        imageView.height(5)
//        imageView.backgroundColor = UIColor(named: "ColorSetLightGray")!
//        imageView.clipsToBounds = true
//        imageView.layer.cornerRadius = 2.5
//        return imageView
//    }()
    
    private var starViews: [BasicRatingStarView] {
        return [fiveStarView, fourStarView, threeStarView, twoStarView, oneStarView]
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        for view in starViews {
            view.setData(with: nil)
        }
        
        ratingStarVStackView.addArrangedSubviews(starViews)
        
        var ratingBarImageViews: [UIView] = []
        (1...5).forEach { index in
            let imageView: UIImageView = UIImageView()
            imageView.width(180)
            imageView.height(5)
            imageView.backgroundColor = UIColor(named: "ColorSetGray")!
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 2.5
            ratingBarImageViews.append(imageView)
        }
        ratingBarVStackView.addArrangedSubviews(ratingBarImageViews)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureAutolayouts() {
     
        self.addSubViews([ratingStarVStackView, ratingBarVStackView])
        ratingStarVStackView.top(self.topAnchor)
        ratingStarVStackView.leading(self.leadingAnchor)
        ratingStarVStackView.bottom(self.bottomAnchor)
        
        ratingBarVStackView.leading(ratingStarVStackView.trailingAnchor, constant: 5)
        ratingBarVStackView.centerY(ratingStarVStackView.centerYAnchor)
        ratingBarVStackView.trailing(self.trailingAnchor)
    }
}
