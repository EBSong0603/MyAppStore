//
//  CompatibilityView.swift
//  myAppStore
//
//  Created by 송은비 on 2020/11/12.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class CompatibilityView: ModuleView {
    
    private let compatiLabel: UILabel = {
        let label = UILabel()
        label.setStyle("Compatibility", textColor: .gray, font: UIFont.systemFont(ofSize: 12))
        return label
    }()
    
    private let compatiInfoLabel: UILabel = {
        let label = UILabel()
        label.setStyle("iPhone", textColor: .black, font: UIFont.systemFont(ofSize: 12))
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
        
        self.addSubViews([compatiLabel, compatiInfoLabel]) 
        compatiLabel.top(self.topAnchor)
        compatiLabel.leading(self.leadingAnchor, constant: 16)
        compatiLabel.bottom(self.bottomAnchor)
        
        compatiInfoLabel.centerY(compatiLabel.centerYAnchor)
        compatiInfoLabel.trailing(self.trailingAnchor, constant: -16)
    }
}



