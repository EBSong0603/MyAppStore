//  File.swift
//  myAppStore
//  Created by 송은비 on 2020/10/17.
//  Copyright © 2020 EB. All rights reserved.

import UIKit

class AppIconInfoView: ModuleView {
  
    var url: String?
    
    private let appIconImageView: BasicAppIconImageView = {
        let imageView = BasicAppIconImageView(appIconStyle: .large)
        imageView.setStyle()
        return imageView
    }()
    private let getButton: BasicButton = {
        let button = BasicButton(buttonStyle: .blue)
        button.setStyle(title: "받기")
        return button
    }()
    
     let furtherButton: UIButton = {
        let button = UIButton()
        button.setImageButton(UIImage(systemName: "square.and.arrow.up")!,
                              tintcolor: UIColor(named: "ColorSetBlue")!,
                              scale: true)
        button.size(20)
        return button
    }()
     
    private let appNameLabel: BasicComponentLabel = {
        let label = BasicComponentLabel(labelStyle: .system20SB)
        label.setStyle(title: "앱이름", color: UIColor(named: "ColorSetBlack")!)
        label.numberOfLines = 2
        return label
    }()
    
    private let subAppNameLabel: BasicComponentLabel = {
        let label = BasicComponentLabel(labelStyle: .system15)
        label.setStyle(title: "앱설명", color: UIColor(named: "ColorSetGray")!)
        return label
    }()
    
    private let appInfoVStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.setStackViewStyle(axis: .vertical, spacing: 0, distribution: .fillProportionally)
        return stackView
    }()
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        
        appInfoVStackView.addArrangedSubviews([appNameLabel, subAppNameLabel])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setData(with data: AppStoreModel.ResultsEntry) {
        let iconImageUrl = data.artworkUrl512
        ImageCacheManager.load(with: iconImageUrl, imageView: appIconImageView)
        appNameLabel.text = data.trackName
        subAppNameLabel.text = data.artistName
    }

    override func configureAutolayouts() {
        self.addSubview(appIconImageView)
        self.addSubview(appInfoVStackView)
        self.addSubview(getButton)
        self.addSubview(furtherButton)
     
        appIconImageView.top(self.topAnchor, constant: 2)
        appIconImageView.leading(self.leadingAnchor, constant: 16)
        appIconImageView.bottom(self.bottomAnchor, constant: -15)
        appIconImageView.width(110)
        appIconImageView.height(110)
 
        appInfoVStackView.top(appIconImageView.topAnchor)
        appInfoVStackView.leading(appIconImageView.trailingAnchor, constant: 16)
        appInfoVStackView.trailing(self.trailingAnchor, constant: -16)
        
        getButton.leading(appIconImageView.trailingAnchor, constant: 16)
        getButton.bottom(appIconImageView.bottomAnchor)
        getButton.width(70)
        getButton.height(28)
        
        furtherButton.trailing(self.trailingAnchor, constant: -16)
        furtherButton.bottom(getButton.bottomAnchor)
    }
}
