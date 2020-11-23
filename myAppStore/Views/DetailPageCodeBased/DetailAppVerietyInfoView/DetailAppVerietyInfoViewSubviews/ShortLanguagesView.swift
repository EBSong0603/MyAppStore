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
    private let langInfoLabel: BasicComponentLabel = {
        let label = BasicComponentLabel(labelStyle: .system12SB)
        label.setStyle(title: "언어", color: .lightGray, alignment: .center)
        return label
    }()
    private let langLabel: BasicComponentLabel = {
        let label = BasicComponentLabel(labelStyle: .arial20)
        label.setStyle(title: "EN", color: .gray, alignment: .center)
        return label
    }()
    private let otherLanguageCountLabel: BasicComponentLabel = {
        let label = BasicComponentLabel(labelStyle: .system12)
        label.setStyle(title: "+ 10 More", color: .gray, alignment: .center)
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
        otherLanguageCountLabel.text = "+ \(data.languageCodesISO2A.count - 1)개 언어"
    }
    
    override func configureAutolayouts() {
        self.addSubview(languageVStackView)
        languageVStackView.edges(self)
    }
}
