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
    
    
    var isGameEnabled: Bool = false
    
    private var appIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "DearMeAppIcon")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 14
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    //보통 스택뷰를 쓰면, 스택뷰 아래에 포함될 객체들 적어둠
    private let appContentsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 5
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        //        stackView.setStackViewStyle(axis: .vertical)
        
        
        return stackView
    }()
    private let appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "앱이름"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    private let appCategoryLabel: UILabel = {
        let label = UILabel()
        label.text = "카테고리"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        return label
    }()
    
    private let starRatingView: StarRatingImageView = {
        let view = StarRatingImageView()
        return view
    }()
    
    private let downLoadButton: GetBasicButton = {
        let button = GetBasicButton(.lightGray)
        button.setStyle(.lightGray, title: "받기")
        button.setInsets(v: 5, h: 16)
    
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
        
        
        //UIStackView의 extension 함수 사용한 코드
        appContentsStackView.addArrangedSubviews([appNameLabel, appCategoryLabel, starRatingView])
        
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setData(with data: AppStoreModel.ResultsEntry?) {
        guard let data = data else {return}
        appNameLabel.text = data.trackName
        appCategoryLabel.text = data.genres.joined(separator: ",")
        
        let appIcon = data.artworkUrl512
        appIconImageView.load(with: appIcon)
        
        if data.isGameCenterEnabled == true {
            appPurchaseLabel.isHidden = false
        } else {
            appPurchaseLabel.isHidden = true
        }
        starRatingView.setData(with: data)
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
            
            appContentsStackView.centerYAnchor.constraint(equalTo: appIconImageView.centerYAnchor),
            //            appContentsStackView.topAnchor.constraint(equalTo: appIconImageView.topAnchor),
            appContentsStackView.leadingAnchor.constraint(equalTo: appIconImageView.trailingAnchor, constant: 8),
            appContentsStackView.widthAnchor.constraint(equalToConstant: 200 * ratio)
            //            appContentsStackView.bottomAnchor.constraint(equalTo: appIconImageView.bottomAnchor)
            //
            
        ])
        
        NSLayoutConstraint.activate([
            
            downLoadButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            downLoadButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            downLoadButton.leadingAnchor.constraint(equalTo: appContentsStackView.trailingAnchor, constant: 16)
            
            
        ])
        
        NSLayoutConstraint.activate([
            
            appPurchaseLabel.topAnchor.constraint(equalTo: downLoadButton.bottomAnchor, constant: 4),
            appPurchaseLabel.trailingAnchor.constraint(equalTo: downLoadButton.trailingAnchor),
            appPurchaseLabel.leadingAnchor.constraint(equalTo: downLoadButton.leadingAnchor)
            
            
            
        ])
    }
    
    
}
