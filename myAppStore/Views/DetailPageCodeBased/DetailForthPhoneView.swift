//
//  DetailThirdViewPhoneView.swift
//  myAppStore
//
//  Created by 송은비 on 2020/10/28.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit

class DetailForthPhoneView: ModuleView {
    
    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.setStyle("Iphone", textColor: .black, font: UIFont.systemFont(ofSize: 20))
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .lightGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureAutolayouts() {
        self.addSubview(phoneLabel)
        phoneLabel.top(self.topAnchor, constant: 4)
        phoneLabel.leading(self.leadingAnchor, constant: 4)
        phoneLabel.bottom(self.bottomAnchor, constant: -4)
        phoneLabel.trailing(self.trailingAnchor, constant: -4)
    }
}
