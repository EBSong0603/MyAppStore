//  SecondShortInformView.swift
//  myAppStore
//  Created by 송은비 on 2020/10/17.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class DetailSecondView: ModuleView {
    
    private let ratingVStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.setStackViewStyle(axis: .vertical, spacing: 0, distribution: .fillEqually)
        return stackView
    }()
    private let ratingView: DetailStarRatingViewSecond = {
        let view = DetailStarRatingViewSecond()
        return view
    }()
    private let reviewCountLabel: UILabel = {
        let label = UILabel()
        label.setStyle("256 Ratings", textColor: .lightGray, font: UIFont.systemFont(ofSize: 12))
        return label
    }()
    
    private let similarInfoVStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.setStackViewStyle(axis: .vertical, spacing: 2, distribution: .fillEqually)
        return stackView
    }()
    private let countLabel: UILabel = {
        let label = UILabel()
        label.setStyle("No 40", textColor: .gray, font: UIFont.systemFont(ofSize: 18, weight: .bold))
        return label
    }()
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.setStyle("여행", textColor: .lightGray, font: UIFont.systemFont(ofSize: 12))
        return label
    }()
    
    private let ageVStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.setStackViewStyle(axis: .vertical, spacing: 2, distribution: .fillEqually)
        return stackView
    }()
    private let ageLabel: UILabel = {
        let label = UILabel()
        label.setStyle("17+", textColor: .gray, font: UIFont.systemFont(ofSize: 18, weight: .bold))
        return label
    }()
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.setStyle("Age", textColor: .lightGray, font: UIFont.systemFont(ofSize: 12))
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.heightAnchor.constraint(equalToConstant: 60).isActive = true
        ratingVStackView.addArrangedSubviews([ratingView,reviewCountLabel])
        similarInfoVStackView.addArrangedSubviews([countLabel, categoryLabel])
        ageVStackView.addArrangedSubviews([ageLabel, infoLabel])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setData(with data: AppStoreModel.ResultsEntry) {
        let userRC: String = data.userRatingCount.formatPoints(from: data.userRatingCount)
        reviewCountLabel.text = userRC + " " + "Ratings"
    }
    
    override func configureAutolayouts() {
        
        self.addSubview(ratingVStackView)
        self.addSubview(similarInfoVStackView)
        self.addSubview(ageVStackView)
        
        ratingVStackView.top(self.topAnchor, constant: 4)
        ratingVStackView.leading(self.leadingAnchor, constant: 16)
        ratingVStackView.bottom(self.bottomAnchor, constant: -4)
        
        similarInfoVStackView.leading(ratingVStackView.trailingAnchor, constant: 120)
        similarInfoVStackView.centerY(ratingVStackView.centerYAnchor)
        
        ageVStackView.trailing(self.trailingAnchor, constant: -16)
        ageVStackView.centerY(similarInfoVStackView.centerYAnchor)
    }
}
