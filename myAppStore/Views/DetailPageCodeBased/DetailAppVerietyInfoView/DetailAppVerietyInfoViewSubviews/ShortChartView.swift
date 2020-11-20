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
    private let infoLabel: UILabel = {
       let label = UILabel()
        label.setStyle("차트", textColor: .lightGray, font: UIFont.systemFont(ofSize: 12, weight: .semibold), textAlignment: .center)
        return label
    }()
    private let rankLabel: UILabel = {
       let label = UILabel()
        label.setStyle("No 4", textColor: .gray, font: UIFont(name: "Arial Rounded MT Bold", size: 20)!, textAlignment: .center)
        return label
    }()
    private let categoryLabel: UILabel = {
       let label = UILabel()
        label.setStyle("Health & Fitness", textColor: .gray, font: UIFont.systemFont(ofSize: 12),
                       textAlignment: .center)
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
