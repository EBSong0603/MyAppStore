//
//  RatingStarFiveStackView.swift
//  myAppStore
//
//  Created by 송은비 on 2020/10/30.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit

class RatingStarFiveStackView: ModuleView {
    
    private let hStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.setStackViewStyle(axis: .horizontal, spacing: 1, distribution: .fillEqually)
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        var fiveStarView: [UIView] = []
        for _ in 1...5 {
            let imageView = UIImageView()
            imageView.image = UIImage(systemName: "star.fill")
            imageView.width(8)
            imageView.height(8)
            imageView.tintColor = .gray
            fiveStarView.append(imageView)
        }
        hStackView.addArrangedSubviews(fiveStarView) 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureAutolayouts() {
        self.addSubview(hStackView)
        hStackView.edges(self)
    }
}
