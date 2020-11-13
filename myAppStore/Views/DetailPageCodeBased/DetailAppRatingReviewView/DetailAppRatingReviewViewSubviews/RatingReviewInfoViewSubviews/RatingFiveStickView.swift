//  DetailSixthViewSecondSubviewStick.swift
//  myAppStore
//  Created by 송은비 on 2020/10/30.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class RatingFiveStickView: ModuleView {
    
    private let reviewStickVStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.setStackViewStyle(axis: .vertical, spacing: 4, distribution: .fillEqually)
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        var subViews: [UIView] = []
            (1...5).forEach { index in
                let imageView: UIImageView = UIImageView()
                imageView.width(180)
                imageView.height(5)
                imageView.backgroundColor = .lightGray
                imageView.clipsToBounds = true
                imageView.layer.cornerRadius = 2.5
                subViews.append(imageView)
            }
        reviewStickVStackView.addArrangedSubviews(subViews)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureAutolayouts() {
        self.addSubview(reviewStickVStackView)
        reviewStickVStackView.edges(self)
    }
}
