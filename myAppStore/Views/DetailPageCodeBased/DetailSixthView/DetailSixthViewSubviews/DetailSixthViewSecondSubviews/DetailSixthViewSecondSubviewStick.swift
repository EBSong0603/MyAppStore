//
//  DetailSixthViewSecondSubviewStick.swift
//  myAppStore
//
//  Created by 송은비 on 2020/10/30.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit

class DetailSixthViewSecondSubviewStick: ModuleView {
    
    private let reviewStickVStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.setStackViewStyle(axis: .vertical, spacing: 4, distribution: .fillEqually)
        return stackView
    }()
    
//    private let viewLabel: UILabel = {
//       let label = UILabel()
//        label.setStyle("모두보기", textColor: .blue, font: UIFont.systemFont(ofSize: 12))
//        return label
//    }()
//    private let reviewRatingLabel: UILabel = {
//       let label = UILabel()
//        label.setStyle("2개의 평가", textColor: .black, font: UIFont.systemFont(ofSize: 12))
//        return label
//    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        var subViews: [UIView] = []
        
        for _ in 1...5 {
            let imageView: UIImageView = UIImageView()
            imageView.width(150)
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
