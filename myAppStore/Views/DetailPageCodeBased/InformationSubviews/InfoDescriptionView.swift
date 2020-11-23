//  InfoDescriptionView.swift
//  myAppStore
//  Created by 송은비 on 2020/11/18.
//  Copyright © 2020 EB. All rights reserved.

import UIKit

class InfoDescriptionView: ModuleView {
    
    private let descriptionLabel: BasicComponentLabel = {
        let label = BasicComponentLabel(labelStyle: .system12)
        label.setStyle(title: "디스크립션", color: .black)
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(with item: InformationItem) {
        
        if let description = item.description {
            descriptionLabel.text = description
        }
    }
    
    override func configureAutolayouts() {
        self.addSubview(descriptionLabel)
        descriptionLabel.top(self.topAnchor)
        descriptionLabel.leading(self.leadingAnchor, constant: 16)
        descriptionLabel.bottom(self.bottomAnchor)
        descriptionLabel.trailing(self.trailingAnchor, constant: -50)
    }
}
