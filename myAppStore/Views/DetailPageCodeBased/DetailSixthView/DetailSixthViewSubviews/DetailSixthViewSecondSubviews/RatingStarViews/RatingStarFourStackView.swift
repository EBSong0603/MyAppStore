//  RatingStarFourStackView.swift
//  myAppStore
//  Created by 송은비 on 2020/10/30.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class RatingStarFourStackView: ModuleView {
    
    private let hStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.setStackViewStyle(axis: .horizontal, spacing: 1, distribution: .fillEqually)
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        var fourStarViews: [UIView] = []
            (1...4).forEach { index in
                let imageView = ratingStar(.smallStar)
                fourStarViews.append(imageView)
            }
        hStackView.addArrangedSubviews(fourStarViews)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureAutolayouts() {
        self.addSubview(hStackView)
        hStackView.edges(self)
    }
}

