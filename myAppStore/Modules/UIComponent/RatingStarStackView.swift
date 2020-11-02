//  RatingStarStackView.swift
//  myAppStore
//  Created by 송은비 on 2020/11/02.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class RatingStarStackView: ModuleView {
    
    private let starHStackView: UIStackView = {
        let hStackView = UIStackView()
        hStackView.setStackViewStyle(axis: .horizontal, spacing: 2, distribution: .fillProportionally)
        hStackView.alignment = .center
        return hStackView
    }()
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDataForMidStar(with data: AppStoreModel.ResultsEntry) {
        starHStackView.removeAllSubViews()
        
        var subViews: [UIView] = []
        let intRating = Int(data.averageUserRating)
        print("intRating: \(intRating)")
        
        for num in 1..<6 {
            let starViewEmpty:ratingStar = ratingStar(.middleStarEmpty)
            let starViewFill: ratingStar = ratingStar(.middleStarFill)
            let imageView: ratingStar = (num <= intRating) ? starViewFill : starViewEmpty
            subViews.append(imageView)
        }
        starHStackView.addArrangedSubviews(subViews)
    }
    
    func setDataForLargeStar(with data: AppStoreModel.ResultsEntry) {
        
        starHStackView.removeAllSubViews()
        var subViews: [UIView] = []
        let intRating = Int(data.averageUserRating)
        print("intRating: \(intRating)")
        
        for num in 1..<6 {
            let starViewEmpty:ratingStar = ratingStar(.largeStarEmpty)
            let starViewFill: ratingStar = ratingStar(.largeStarFill)
            let imageView1: ratingStar = (num <= intRating) ? starViewFill : starViewEmpty
            subViews.append(imageView1)
        }
        starHStackView.addArrangedSubviews(subViews)
    }
    
    override func configureAutolayouts() {
        
        self.addSubview(starHStackView)
        starHStackView.top(self.topAnchor, constant: 0)
        starHStackView.leading(self.leadingAnchor, constant: 0)
        starHStackView.trailing(self.trailingAnchor, constant: 0)
        starHStackView.bottom(self.bottomAnchor, constant: 0)
    }
}

