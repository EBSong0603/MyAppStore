//  DetailSecondViewSecond.swift
//  myAppStore
//  Created by 송은비 on 2020/10/28.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class DetailSecondViewSecond: ModuleView {
    
    private let ageVStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.setStackViewStyle(axis: .vertical, spacing: 2, distribution: .fillEqually)
        stackView.alignment = .center
        return stackView
    }()
    private let infoLabel: UILabel = {
       let label = UILabel()
        label.setStyle("연령", textColor: .lightGray, font: UIFont.systemFont(ofSize: 14), textAlignment: .center)
        return label
    }()
    private let ageLabel: UILabel = {
    let label = UILabel()
        label.setStyle("17+", textColor: .gray, font: UIFont.systemFont(ofSize: 20), textAlignment: .center)
        return label
    }()
    private let ageSufixLabel: UILabel = {
      let label = UILabel()
        label.setStyle("세", textColor: .lightGray, font: UIFont.systemFont(ofSize: 14), textAlignment: .center)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
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
