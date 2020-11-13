//
//  ProvideView.swift
//  myAppStore
//
//  Created by 송은비 on 2020/11/12.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class ProvideView: ModuleView {
    
    private let providerLabel: UILabel = {
        let label = UILabel()
        label.setStyle("Provider", textColor: .gray, font: UIFont.systemFont(ofSize: 12))
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.setStyle("아무개", textColor: .black, font: UIFont.systemFont(ofSize: 12))
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
        nameLabel.text = data.artistName
        
    }
    
    override func configureAutolayouts() {
        self.addSubViews([providerLabel, nameLabel])
        
        providerLabel.top(self.topAnchor)
        providerLabel.leading(self.leadingAnchor, constant: 16)
        providerLabel.bottom(self.bottomAnchor)
        nameLabel.centerY(providerLabel.centerYAnchor)
        nameLabel.trailing(self.trailingAnchor, constant: -16)
    }
}

