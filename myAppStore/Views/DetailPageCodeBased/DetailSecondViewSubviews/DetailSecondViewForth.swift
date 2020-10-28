//
//  DetailSecondViewForth.swift
//  myAppStore
//
//  Created by 송은비 on 2020/10/28.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit

class DetailSecondViewForth: ModuleView {
    
    
        private let languageVStackView = UIStackView().style(axis: .vertical, spacing: 2, distribution: .fillEqually)


    
      private let langInfoLabel: UILabel = {
          let label = UILabel()
        label.setStyle("언어", textColor: .lightGray, font: UIFont.systemFont(ofSize: 14), textAlignment: .center)
           return label
       }()

       private let langLabel: UILabel = {
       let label = UILabel()
        label.setStyle("EN", textColor: .gray, font: UIFont.systemFont(ofSize: 20), textAlignment: .center)
           return label
       }()
       
    
       private let langKoreanLabel: UILabel = {
         let label = UILabel()
        label.setStyle("영어", textColor: .lightGray, font: UIFont.systemFont(ofSize: 14), textAlignment: .center)
           return label
       }()
       
       
    
    
    
    
    
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.width(150)

        languageVStackView.addArrangedSubviews([langInfoLabel, langLabel, langKoreanLabel])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func configureAutolayouts() {
        self.addSubview(languageVStackView)
        languageVStackView.edges(self)
    }
}
