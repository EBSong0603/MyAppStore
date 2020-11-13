//  File.swift
//  myAppStore
//  Created by 송은비 on 2020/10/17.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class DetailAppIconInfoView: ModuleView {
    
    private let appIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.setImageViewStyle(UIImage(named: "DearMeAppIcon")!, radius: 20, contentMode: .scaleAspectFill)
        return imageView
    }()
    
    private let getButton: BasicGetButton = {
        let button = BasicGetButton(.blue)
        button.setStyle(.blue, title: "받기")
        button.setInsets(vertical: 5, horizonal: 16)
        return button
    }()
    
    private let furtherButton: UIButton = {
        let button = UIButton()
        button.setImageButton(UIImage(systemName: "square.and.arrow.up")!, tintcolor: .systemBlue, scale: true)
        return button
    }()
     
    private let appNameLabel: UILabel = {
        let label = UILabel()
        label.setStyle("앱이름", textColor: .black, font: UIFont.systemFont(ofSize: 20, weight: .semibold))
        label.numberOfLines = 2
        return label
    }()
    
    private let subAppNameLabel: UILabel = { 
        let label = UILabel()
        label.setStyle("회사이름", textColor: .gray, font: UIFont.systemFont(ofSize: 15))
        return label
    }()
    
    private let appInfoVStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.setStackViewStyle(axis: .vertical, spacing: 0, distribution: .fillProportionally)
        return stackView
    }()
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        appInfoVStackView.addArrangedSubviews([appNameLabel, subAppNameLabel])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setData(with data: AppStoreModel.ResultsEntry) {
        appIconImageView.load(with: data.artworkUrl512)
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
//        furtherButton.height(30)
//        furtherButton.width(30)
    }
}
