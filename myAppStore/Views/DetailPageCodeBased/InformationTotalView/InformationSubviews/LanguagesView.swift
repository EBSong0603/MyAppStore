//
//  LanguagesView.swift
//  myAppStore
//
//  Created by 송은비 on 2020/11/12.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class LanguagesView: ModuleView {
    
    private let langLabel: UILabel = {
        let label = UILabel()
        label.setStyle("Languages", textColor: .gray, font: UIFont.systemFont(ofSize: 12))
        return label
    }()
    
    private let langInfoLabel: UILabel = {
        let label = UILabel()
        label.setStyle("Korean and English", textColor: .black, font: UIFont.systemFont(ofSize: 12))
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    func setData(with data: AppStoreModel.ResultsEntry) {
 
        
//        var practiceLang: [String] = []
        let langsCount: Int = data.languageCodesISO2A.count
        
        
        let willFiltered: [String] = data.languageCodesISO2A.makeFilteredStringArray(with: data.languageCodesISO2A, count: 1)

        var finalLanguageArray : [String] = []
            
        finalLanguageArray = willFiltered.languageChange(with: willFiltered)
        
        langInfoLabel.text = (langsCount > 2) ? "\(finalLanguageArray.first ?? "") and \(langsCount - 1) more" : "\(finalLanguageArray.joined(separator: " and "))"
    }

    override func configureAutolayouts() {
        
        self.addSubViews([langLabel, langInfoLabel])
        langLabel.top(self.topAnchor)
        langLabel.leading(self.leadingAnchor, constant: 16)
        langLabel.bottom(self.bottomAnchor)
        
        langInfoLabel.centerY(langLabel.centerYAnchor)
        langInfoLabel.trailing(self.trailingAnchor, constant: -16)
    }
}



