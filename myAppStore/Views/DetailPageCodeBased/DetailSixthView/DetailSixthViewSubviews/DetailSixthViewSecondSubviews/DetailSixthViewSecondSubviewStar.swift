//  DetailSixthViewThird.swift
//  myAppStore
//  Created by 송은비 on 2020/10/30.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class DetailSixthViewSecondSubviewStar: ModuleView {
    
    private let vStackView: UIStackView = {
          let stackView = UIStackView()
          stackView.setStackViewStyle(axis: .vertical, spacing: 1, distribution: .fillEqually)
          stackView.alignment = .trailing
          return stackView
      }()
    private let fiveStarView = RatingStarFiveStackView()
    private let fourStarView = RatingStarFourStackView()
    private let threeStarView = RatingStarThreeStackView()
    private let twoStarView = RatingStarTwoStackView()
    private let oneStarView = RatingStarOneStackView()
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        vStackView.addArrangedSubviews([fiveStarView, fourStarView, threeStarView, twoStarView, oneStarView])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureAutolayouts() {
        
        self.addSubview(vStackView)
        vStackView.edges(self)
    }
}
