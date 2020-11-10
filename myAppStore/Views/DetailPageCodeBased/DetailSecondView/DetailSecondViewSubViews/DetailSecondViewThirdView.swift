//  DetailSecondViewThirdView.swift
//  myAppStore
//  Created by 송은비 on 2020/11/09.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class DetailSecondViewThirdView: ModuleView {
    
    private let ChartVStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.setStackViewStyle(axis: .vertical, spacing: 2, distribution: .fillEqually)
        return stackView
    }()
    private let infoLabel: UILabel = {
       let label = UILabel()
        label.setStyle("CHART", textColor: .lightGray, font: UIFont.systemFont(ofSize: 14), textAlignment: .center)
        return label
    }()
    private let rankLabel: UILabel = {
       let label = UILabel()
        label.setStyle("No4", textColor: .gray, font: UIFont.systemFont(ofSize: 20), textAlignment: .center)
        return label
    }()
    private let categoryLabel: UILabel = {
       let label = UILabel()
        label.setStyle("Health & Fitness", textColor: .lightGray, font: UIFont.systemFont(ofSize: 14),
                       textAlignment: .center)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
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
