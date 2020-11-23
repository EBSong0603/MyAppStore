//  DetailSecondViewThirdView.swift
//  myAppStore
//  Created by 송은비 on 2020/11/09.
//  Copyright © 2020 EB. All rights reserved.

import UIKit

class ShortChartView: ModuleView {
    
    private let ChartVStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.setStackViewStyle(axis: .vertical, spacing: 2, distribution: .fillEqually)
        return stackView
    }()
    private let infoLabel: BasicComponentLabel = {
        let label = BasicComponentLabel(labelStyle: .system12SB)
        label.setStyle(title: "차트", color: .lightGray, alignment: .center)
        return label
    }()
    private let rankLabel: BasicComponentLabel = {
        let label = BasicComponentLabel(labelStyle: .arial20)
        label.setStyle(title: "No 4", color: .gray, alignment: .center)
        return label
    }()
    private let categoryLabel: BasicComponentLabel = {
        let label = BasicComponentLabel(labelStyle: .system12)
        label.setStyle(title: "Health & Fitness", color: .gray, alignment: .center)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.height(70)
        self.width(100)
        ChartVStackView.addArrangedSubviews([infoLabel, rankLabel, categoryLabel])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(with data: AppStoreModel.ResultsEntry) {
        categoryLabel.text = data.primaryGenreName
    }
    
    override func configureAutolayouts() {
        self.addSubview(ChartVStackView)
        ChartVStackView.edges(self)
    }
}
