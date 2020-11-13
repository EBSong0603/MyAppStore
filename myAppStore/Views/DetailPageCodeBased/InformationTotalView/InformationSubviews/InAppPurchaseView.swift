//
//  InAppPurchaseView.swift
//  myAppStore
//
//  Created by 송은비 on 2020/11/12.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class InAppPurchaseView: ModuleView {
    
    private let inAppLabel: UILabel = {
        let label = UILabel()
        label.setStyle("In-App Purchase", textColor: .gray, font: UIFont.systemFont(ofSize: 12))
        return label
    }()
    
    private let inAppInfoLabel: UILabel = {
        let label = UILabel()
        label.setStyle("Yes", textColor: .black, font: UIFont.systemFont(ofSize: 12))
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
        
        self.addSubViews([inAppLabel, inAppInfoLabel])
        inAppLabel.top(self.topAnchor)
        inAppLabel.leading(self.leadingAnchor, constant: 16)
        inAppLabel.bottom(self.bottomAnchor)
        
        inAppInfoLabel.centerY(inAppLabel.centerYAnchor)
        inAppInfoLabel.trailing(self.trailingAnchor, constant: -16)
    }
}



