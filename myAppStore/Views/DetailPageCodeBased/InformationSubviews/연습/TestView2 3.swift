//
//  AgeRatingViewSubview.swift
//  myAppStore
//
//  Created by 송은비 on 2020/11/13.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit

class TestView2: ModuleView {
    
    
    private let ageLabel: UILabel = {
       let label = UILabel()
        label.setStyle("TestLabel2", textColor: .gray, font: UIFont.systemFont(ofSize: 12))
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
    
    }
    
    override func configureAutolayouts() {
        self.addSubViews([ageLabel])
        ageLabel.edges(self)

    }
    
}
