//  DetailSixthViewFirst.swift
//  myAppStore
//  Created by 송은비 on 2020/10/30.
//  Copyright © 2020 EB. All rights reserved.

import UIKit

class RatingReviewTitleView: ModuleView {
    
    private let reviewLabel: BasicComponentLabel = {
        let label = BasicComponentLabel(labelStyle: .system20B)
        label.setStyle(title: "평가 및 리뷰", color: .black)
        return label
    }()
    
    private let furtherLabel: BasicComponentLabel = {
        let label = BasicComponentLabel(labelStyle: .system15)
        label.setStyle(title: "모두보기", color: .systemBlue)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func configureAutolayouts() {
        
        self.addSubViews([reviewLabel, furtherLabel])
        reviewLabel.top(self.topAnchor)
        reviewLabel.leading(self.leadingAnchor, constant: 16)
        reviewLabel.bottom(self.bottomAnchor)
        
        furtherLabel.centerY(reviewLabel.centerYAnchor)
        furtherLabel.trailing(self.trailingAnchor, constant: -16)
    }
}
