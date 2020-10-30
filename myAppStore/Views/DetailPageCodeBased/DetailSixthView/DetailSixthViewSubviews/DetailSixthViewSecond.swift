//
//  DetauilSixthViewSecond.swift
//  myAppStore
//
//  Created by 송은비 on 2020/10/30.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit

class DetailSixthViewSecond: ModuleView {
    
        private let reviewIntLabel: UILabel = {
            let label = UILabel()
            label.setStyle("5.0", textColor: .black, font: UIFont.systemFont(ofSize: 50), textAlignment: .left)
            return label
        }()
        
    private let reviewStickView = DetailSixthViewSecondSubviewStick()
    
    private let reviewStarView = DetailSixthViewSecondSubviewStar()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureAutolayouts() {
        self.addSubViews([reviewIntLabel, reviewStarView, reviewStickView])
        
        
        reviewStickView.top(self.topAnchor)
        reviewStickView.trailing(self.trailingAnchor, constant: -16)
        reviewStickView.bottom(self.bottomAnchor)
        
//        reviewStarView.top(reviewStickView.topAnchor)
        reviewStarView.trailing(reviewStickView.leadingAnchor, constant: -10)
        reviewStarView.leading(reviewIntLabel.trailingAnchor, constant: 16)
        
        reviewStarView.centerY(reviewIntLabel.centerYAnchor)
        reviewIntLabel.centerY(reviewStickView.centerYAnchor)
        reviewIntLabel.leading(self.leadingAnchor, constant: 16)
            }
}
