//
//  AgeRatingView.swift
//  myAppStore
//  Created by 송은비 on 2020/11/12.
//  Copyright © 2020 EB. All rights reserved.

import UIKit

class AgeRatingView: ModuleView {
    
//    private let openButton: UIButton = UIButton()

    private let ageRatingLabel: UILabel = {
       let label = UILabel()
        label.setStyle("Age Rating", textColor: .gray, font: UIFont.systemFont(ofSize: 12))
        return label
    }()
 
    private let ratingInfoLabel: UILabel = {
       let label = UILabel()
        label.setStyle("4+", textColor: .black, font: UIFont.systemFont(ofSize: 12))
        return label
    }()
    
    private let clickImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star")
        imageView.tintColor = .gray
        imageView.width(20)
        imageView.height(20)
        return imageView
    }()
    
    private var ratingInfoLabelConstraint1: NSLayoutConstraint? = nil
    private var ratingInfoLabelConstraint2: NSLayoutConstraint? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
   
        willChangedConstraint()
//        openButton.addTarget(self, action: #selector(openButtonClicked), for: .touchUpInside)

//        clickImageView.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

     @objc private func openButtonClicked() {

    }
    
    
    private func willChangedConstraint() {
//        ratingInfoLabelConstraint1 = ratingInfoLabel.leadingAnchor.constraint(equalTo: ageRatingLabel.trailingAnchor, constant: 10)
//        ratingInfoLabelConstraint1?.isActive = true
//        ratingInfoLabelConstraint1?.priority = UILayoutPriority(rawValue: 500)
//
//
//        ratingInfoLabelConstraint2 = ratingInfoLabel.leadingAnchor.constraint(equalTo: ageRatingLabel.trailingAnchor, constant: 60)
//        ratingInfoLabelConstraint2?.isActive = true
//        ratingInfoLabelConstraint2?.priority = UILayoutPriority(rawValue: 250)
    }
    
    
    func setData(with data: AppStoreModel.ResultsEntry) {
        ratingInfoLabel.text = data.trackContentRating
    }

    
    override func configureAutolayouts() {

        self.addSubViews([ageRatingLabel, ratingInfoLabel, clickImageView])
        ageRatingLabel.top(self.topAnchor)
        ageRatingLabel.leading(self.leadingAnchor, constant: 16)
        ageRatingLabel.bottom(self.bottomAnchor)
        
        ratingInfoLabel.centerY(ageRatingLabel.centerYAnchor)
//        ratingInfoLabel.trailing(self.trailingAnchor, constant: -70)
        
        clickImageView.centerY(ageRatingLabel.centerYAnchor)
        clickImageView.trailing(self.trailingAnchor, constant: -16)
        
        let constant1: CGFloat = -16
        let constant2: CGFloat = -70
        
        //안되나욤? ㅠㅠ ㅎ
        if clickImageView.isHidden == true {
            ratingInfoLabel.trailing(self.trailingAnchor, constant: constant1)
        } else {
            ratingInfoLabel.trailing(self.trailingAnchor, constant: constant2)
        }
       
    }
}



