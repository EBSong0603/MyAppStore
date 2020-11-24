//
//  BigTitleCategoryView.swift
//  myAppStore
//
//  Created by 송은비 on 2020/11/25.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit

class BigTitleCategoryView: ModuleView {
    
    var bigTitle: String
    var subTitle: String?
    
    private let bigTitleLabel: BasicComponentLabel = {
        let label = BasicComponentLabel(labelStyle: .system20B)
        label.setStyle(title: "새로운기능", color: .black)
        return label
    }()
    
    private let subTitleLabel: BasicComponentLabel = {
        let label = BasicComponentLabel(labelStyle: .system15)
        label.setStyle(title: "버전기록", color: .systemBlue)
        return label
    }()
    
    init(with bigTitle: String, with subTitle: String?) {
        self.bigTitle = bigTitle
        self.subTitle = subTitle
        super.init(frame: .zero)
        setStyle()
    }
    
    func setStyle() {
        bigTitleLabel.text = bigTitle
        subTitleLabel.text = subTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureAutolayouts() {
        self.addSubViews([bigTitleLabel, subTitleLabel])
        bigTitleLabel.top(self.topAnchor)
        bigTitleLabel.leading(self.leadingAnchor, constant: 16)
        bigTitleLabel.bottom(self.bottomAnchor)
        
        subTitleLabel.trailing(self.trailingAnchor, constant: -16)
        subTitleLabel.centerY(bigTitleLabel.centerYAnchor)
    }
}
