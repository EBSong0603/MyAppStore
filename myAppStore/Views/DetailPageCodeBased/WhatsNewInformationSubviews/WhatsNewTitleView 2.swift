//
//  WhatsNewView.swift
//  myAppStore
//
//  Created by 송은비 on 2020/11/11.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit

class WhatsNewTitleView: ModuleView {
 
    private let whatsNewLabel: UILabel = {
       let label = UILabel()
        label.setStyle("What's New", textColor: .black, font: UIFont.systemFont(ofSize: 20, weight: .bold))
        return label
    }()
    
    private let versionLabel: UILabel = {
       let label = UILabel()
        label.setStyle("Version History", textColor: .systemBlue, font: UIFont.systemFont(ofSize: 15))
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureAutolayouts() {
        self.addSubViews([whatsNewLabel, versionLabel])
        
        
        whatsNewLabel.leading(self.leadingAnchor, constant: 16)
        whatsNewLabel.top(self.topAnchor)
        whatsNewLabel.bottom(self.bottomAnchor)
        
        versionLabel.centerY(self.centerYAnchor)
        versionLabel.trailing(self.trailingAnchor, constant: -16)
    }
    
}
