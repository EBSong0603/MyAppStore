//  StarRatingImageView.swift
//  myAppStore
//  Created by 송은비 on 2020/10/20.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class RatingContentsView: ModuleView {
    
    private let ratingContentsHStackView: UIStackView = {
        let hStackView = UIStackView()
        hStackView.setStackViewStyle(axis: .horizontal, spacing: 2, distribution: .fillProportionally)
        return hStackView
    }()
    //여기에서 RatingStarStackView의 이니셜라이즈를 결정해줄 매개변수에 값을 담아 class를 참조한다 (어떤 별의 타입을, 어떤 숫자를 넣어주냐에 따라 다른 이니셜라이즈드된 클래스가 나올것이다)
    private let fiveStarStackView = BasicRatingStarView(starStyle: .middle, count: 5)
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.setStyle("", textColor: .gray, font: UIFont.systemFont(ofSize: 12), textAlignment: .left)
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        ratingContentsHStackView.addArrangedSubviews([fiveStarStackView, ratingLabel])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(with data: AppStoreModel.ResultsEntry) {
        
        fiveStarStackView.setData(with: data)
        let userRC: String = data.userRatingCount.formatPoints(from: data.userRatingCount)
        ratingLabel.text = userRC
    }

    override func configureAutolayouts() {
        
        self.addSubview(ratingContentsHStackView)
        ratingContentsHStackView.top(self.topAnchor, constant: 0)
        ratingContentsHStackView.leading(self.leadingAnchor, constant: 0)
        ratingContentsHStackView.trailing(self.trailingAnchor, constant: 0)
        ratingContentsHStackView.bottom(self.bottomAnchor, constant: 0) 
    }
}


