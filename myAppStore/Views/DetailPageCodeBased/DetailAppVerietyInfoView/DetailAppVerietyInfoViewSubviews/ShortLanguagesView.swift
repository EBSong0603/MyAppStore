//  DetailSecondViewForth.swift
//  myAppStore
//  Created by 송은비 on 2020/10/28.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class ShortLanguagesView: ModuleView {

    private let languageVStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.setStackViewStyle(axis: .vertical, spacing: 2, distribution: .fillEqually)
        stackView.alignment = .center
        return stackView
    }()
    private let langInfoLabel: UILabel = {
        let label = UILabel()
        label.setStyle("언어", textColor: .lightGray, font: UIFont.systemFont(ofSize: 12, weight: .semibold), textAlignment: .center)
        return label
    }()
    private let langLabel: UILabel = {
        let label = UILabel()
        label.setStyle("EN", textColor: .gray, font: UIFont(name: "Arial Rounded MT Bold", size: 20)!, textAlignment: .center)
        return label
    }()
    private let otherLanguageCountLabel: UILabel = {
        let label = UILabel()
        label.setStyle("+ 10 More", textColor: .gray, font: UIFont.systemFont(ofSize: 12), textAlignment: .center)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        self.height(70)
        self.width(100)
        languageVStackView.addArrangedSubviews([langInfoLabel, langLabel, otherLanguageCountLabel])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(with data: AppStoreModel.ResultsEntry) {
    
        langLabel.text = data.languageCodesISO2A.first
        otherLanguageCountLabel.text = "+ \(data.languageCodesISO2A.count - 1) More"
    }
    
    override func configureAutolayouts() {
        self.addSubview(languageVStackView)
        languageVStackView.edges(self)
    }
}
