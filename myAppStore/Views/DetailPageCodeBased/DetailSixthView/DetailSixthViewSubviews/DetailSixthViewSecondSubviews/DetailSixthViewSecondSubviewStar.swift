//
//  DetailSixthViewThird.swift
//  myAppStore
//
//  Created by 송은비 on 2020/10/30.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit

class DetailSixthViewSecondSubviewStar: ModuleView {
    
    
    private let fiveStarView = RatingStarFiveStackView()
    private let fourStarView = RatingStarFourStackView()
    private let threeStarView = RatingStarThreeStackView()
    private let twoStarView = RatingStarTwoStackView()
    private let oneStarView = RatingStarOneStackView()
    
    private let vStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.setStackViewStyle(axis: .vertical, spacing: 1, distribution: .fillEqually)
        stackView.alignment = .trailing
        return stackView
    }()
//
//    private let hStackView1: UIStackView = {
//       let stackView = UIStackView()
//        stackView.setStackViewStyle(axis: .horizontal, spacing: 2, distribution: .fillEqually)
//        return stackView
//    }()
//
//    private let hStackView2: UIStackView = {
//         let stackView = UIStackView()
//        stackView.setStackViewStyle(axis: .horizontal, spacing: 2, distribution: .fillEqually)
//          return stackView
//      }()
    
//    private let starImageView = ratingStar()
//     var fiveStarView: [UIView] = []
//    var fourStarView: [UIView] = []
//
    override init(frame: CGRect) {
        super.init(frame: frame)
//        hStackView1.addArrangedSubviews(fiveStarView)
//        hStackView2.addArrangedSubviews(fourStarView)
//
//        vStackView.addArrangedSubviews([hStackView1, hStackView2])
//        starFiveMake()
//           starFourMake()
        vStackView.addArrangedSubviews([fiveStarView, fourStarView, threeStarView, twoStarView, oneStarView])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureAutolayouts() {
//        self.addSubview(hStackView1)
//        self.addSubview(hStackView2)
//
//        self.addSubview(vStackView)
//
        self.addSubview(vStackView)
//
        vStackView.edges(self)
        
    }
//
//    func starFiveMake() {
//
//
//        for _ in 1...5 {
//
//            let imageView = starImageView
//        fiveStarView.append(imageView)
//    }
//
//    }
//
//    func starFourMake() {
//        for _ in 1...4 {
//
//                   let imageView = starImageView
//               fourStarView.append(imageView)
//           }
//    }
//
    
}
