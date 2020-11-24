//  DetailSixthViewThird.swift
//  myAppStore
//  Created by 송은비 on 2020/10/30.
//  Copyright © 2020 EB. All rights reserved.

import UIKit

class FullStarStackView: ModuleView {
    
    private let starsVStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.setStackViewStyle(axis: .vertical, spacing: 1, distribution: .fillEqually)
        stackView.alignment = .trailing
        return stackView
    }()
    private let fiveStarView = BasicRatingStarView(starStyle: .small, count: 5)
    private let fourStarView = BasicRatingStarView(starStyle: .small, count: 4)
    private let threeStarView = BasicRatingStarView(starStyle: .small, count: 3)
    private let twoStarView = BasicRatingStarView(starStyle: .small, count: 2)
    private let oneStarView = BasicRatingStarView(starStyle: .small, count: 1)
    
    private var starViews: [BasicRatingStarView] {
        return [fiveStarView, fourStarView, threeStarView, twoStarView, oneStarView]
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        for view in starViews {
            view.setData(with: nil)
        }
        starsVStackView.addArrangedSubviews(starViews)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureAutolayouts() {
        
        self.addSubview(starsVStackView)
        starsVStackView.edges(self)
    }
}
