//
//  File.swift
//  myAppStore
//
//  Created by 송은비 on 2020/10/17.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit
import Foundation

class FirstAppInformationView: UIView {
    
    
    static let identifier = "FirstAppInformationView"
    
    
    private let appIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "DearMeAppIcon")
        imageView.tintColor = .black
        imageView.backgroundColor = .lightGray
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    private let appContentsStackView: UIStackView = {
        
        let appNameLabel: UILabel = {
            let label = UILabel()
            label.text = "앱이름"
            label.font = UIFont.systemFont(ofSize: 16)
            return label
        }()
        
        let appCategoryLabel: UILabel = {
            let label = UILabel()
            label.text = "카테고리"
            label.font = UIFont.systemFont(ofSize: 12)
            label.textColor = .gray
            return label
        }()
        
        let starRatingView: StarRatingView = {
            let view = StarRatingView()
            return view
        }()
        
        let stackView = UIStackView(arrangedSubviews: [appNameLabel, appCategoryLabel, starRatingView])
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .lightGray
        
        return stackView
    }()
    
    
    private let downLoadButton: UIButton = {
        let button = UIButton()
        button.setTitle("받기", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .lightGray
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        
        return button
    }()
    
    private let appPurchaseLabel: UILabel = {
        
        let label = UILabel()
        label.text = "앱내구입"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 10)
        label.textAlignment = .center
        
        return label
        
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        self.backgroundColor = .white
        configureAutoLayouts()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configureAutoLayouts() {
        
        let ratio: CGFloat = (UIScreen.main.bounds.width / 375)
        
        self.addSubview(appIconImageView)
        self.addSubview(appContentsStackView)
        self.addSubview(downLoadButton)
        self.addSubview(appPurchaseLabel)
        
        
        appIconImageView.translatesAutoresizingMaskIntoConstraints = false
        downLoadButton.translatesAutoresizingMaskIntoConstraints = false
        appContentsStackView.translatesAutoresizingMaskIntoConstraints = false
        appPurchaseLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            appIconImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            appIconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            appIconImageView.heightAnchor.constraint(equalToConstant: 60),
            appIconImageView.widthAnchor.constraint(equalToConstant: 60),
            appIconImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
            
        ])
        
        NSLayoutConstraint.activate([
            
            appContentsStackView.topAnchor.constraint(equalTo: appIconImageView.topAnchor),
            appContentsStackView.leadingAnchor.constraint(equalTo: appIconImageView.trailingAnchor, constant: 8),
            appContentsStackView.widthAnchor.constraint(equalToConstant: 200 * ratio),
            appContentsStackView.bottomAnchor.constraint(equalTo: appIconImageView.bottomAnchor)
            
            
        ])
        
        NSLayoutConstraint.activate([
            
            downLoadButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            downLoadButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            downLoadButton.widthAnchor.constraint(equalToConstant: 50),
            downLoadButton.heightAnchor.constraint(equalToConstant: 20),
            downLoadButton.leadingAnchor.constraint(equalTo: appContentsStackView.trailingAnchor, constant: 16)
            
            
        ])
        
        
        NSLayoutConstraint.activate([
            
            appPurchaseLabel.topAnchor.constraint(equalTo: downLoadButton.bottomAnchor, constant: 4),
            appPurchaseLabel.trailingAnchor.constraint(equalTo: downLoadButton.trailingAnchor),
            appPurchaseLabel.leadingAnchor.constraint(equalTo: downLoadButton.leadingAnchor)
            
            
            
        ])
    }
    
    
}
