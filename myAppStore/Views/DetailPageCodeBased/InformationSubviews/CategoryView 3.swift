//
//  CategoryView.swift
//  myAppStore
//
//  Created by 송은비 on 2020/11/12.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class CategoryView: ModuleView {
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.setStyle("Category", textColor: .gray, font: UIFont.systemFont(ofSize: 12))
        return label
    }()
    
    private let categoryInfoLabel: UILabel = {
        let label = UILabel()
        label.setStyle("Health & Fitness", textColor: .black, font: UIFont.systemFont(ofSize: 12))
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
        categoryInfoLabel.text = data.primaryGenreName
    }
    
    override func configureAutolayouts() {
        
        self.addSubViews([categoryLabel, categoryInfoLabel])
        categoryLabel.top(self.topAnchor)
        categoryLabel.leading(self.leadingAnchor, constant: 16)
        categoryLabel.bottom(self.bottomAnchor)
        
        categoryInfoLabel.centerY(categoryLabel.centerYAnchor)
        categoryInfoLabel.trailing(self.trailingAnchor, constant: -16)
    }
}



