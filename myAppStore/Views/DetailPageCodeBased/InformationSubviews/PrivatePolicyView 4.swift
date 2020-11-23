//
//  PrivatePolicyView.swift
//  myAppStore
//
//  Created by 송은비 on 2020/11/12.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class PrivatePolicyView: ModuleView {
    
    private let PrivatePolicyLabel: UILabel = {
        let label = UILabel()
        label.setStyle("Private Policy", textColor: .systemBlue, font: UIFont.systemFont(ofSize: 12))
        return label
    }()
    
    private let policyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.width(18)
        imageView.height(18)
        imageView.setImageViewStyle(UIImage(systemName: "hand.raised.fill")!)
        imageView.tintColor = .systemBlue
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureAutolayouts() {
        
        self.addSubViews([PrivatePolicyLabel, policyImageView])
        PrivatePolicyLabel.top(self.topAnchor)
        PrivatePolicyLabel.leading(self.leadingAnchor, constant: 16)
        PrivatePolicyLabel.bottom(self.bottomAnchor, constant: -40)
        
        policyImageView.centerY(PrivatePolicyLabel.centerYAnchor)
        policyImageView.trailing(self.trailingAnchor, constant: -16)
    }
}



