//  DetailSecondViewSecond.swift
//  myAppStore
//  Created by 송은비 on 2020/10/28.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class ShortAgeView: ModuleView {
    
    private let ageVStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.setStackViewStyle(axis: .vertical, spacing: 2, distribution: .fillEqually)
        stackView.alignment = .center
        return stackView
    }()
    private let infoLabel: BasicComponentLabel = {
        let label = BasicComponentLabel(labelStyle: .system12SB)
        label.setStyle(title: "연령", color: .lightGray, alignment: .center)
        return label
    }()
    private let ageLabel: BasicComponentLabel = {
        let label = BasicComponentLabel(labelStyle: .arial20)
        label.setStyle(title: "147+", color: .gray, alignment: .center)
        return label
    }()
    private let ageSufixLabel: BasicComponentLabel = {
        let label = BasicComponentLabel(labelStyle: .system12)
        label.setStyle(title: "세", color: .gray, alignment: .center)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.height(70)
        self.width(100)
        ageVStackView.addArrangedSubviews([infoLabel, ageLabel, ageSufixLabel])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(with data: AppStoreModel.ResultsEntry) {
        ageLabel.text = data.contentAdvisoryRating
    }
    
    override func configureAutolayouts() {
        self.addSubview(ageVStackView)
        ageVStackView.edges(self)
    }
}
