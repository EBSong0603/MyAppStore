//  File.swift
//  myAppStore
//  Created by 송은비 on 2020/10/17.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class DetailTopView: UIView {
    
    var topcontentData: AppStoreModel.ResultsEntry?
    
    static let identifier = "DetailTopView"
    
    private let appIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "DearMeAppIcon")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let getButton: UIButton = {
        let button = UIButton()
        button.setTitle("받기", for: .normal)
        button.backgroundColor = .systemBlue
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let furtherButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.tintColor = .systemBlue
        button.scalesLargeContentImage = true
        return button
    }()
    
    
    private let appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "앱이름"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private let subAppNameLabel: UILabel = {
        
        let label = UILabel()
        label.text = "서브이름"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    
    private let appInfoVStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 0
        return stackView
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        configureAutoLayouts()
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
    
    
    private func configureAutoLayouts() {
        
        self.addSubview(appIconImageView)
        self.addSubview(appInfoVStackView)
        self.addSubview(getButton)
        self.addSubview(furtherButton)
        
        appIconImageView.translatesAutoresizingMaskIntoConstraints = false
        appInfoVStackView.translatesAutoresizingMaskIntoConstraints = false
        getButton.translatesAutoresizingMaskIntoConstraints = false
        furtherButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        NSLayoutConstraint.activate([
            
            appIconImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 2),
            appIconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            //            appIconImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            appIconImageView.heightAnchor.constraint(equalToConstant: 100),
            appIconImageView.widthAnchor.constraint(equalToConstant: 100),
            appIconImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            
            
        ])
        
        NSLayoutConstraint.activate([
            
            
            appInfoVStackView.topAnchor.constraint(equalTo: appIconImageView.topAnchor),
            appInfoVStackView.leadingAnchor.constraint(equalTo: appIconImageView.trailingAnchor, constant: 16)
            
        ])
        
        
        NSLayoutConstraint.activate([
            
            
            getButton.leadingAnchor.constraint(equalTo: appIconImageView.trailingAnchor, constant: 16),
            getButton.widthAnchor.constraint(equalToConstant: 60),
            getButton.heightAnchor.constraint(equalToConstant: 20),
            getButton.bottomAnchor.constraint(equalTo: appIconImageView.bottomAnchor)
            
            
        ])
        
        NSLayoutConstraint.activate([
            
            furtherButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            furtherButton.bottomAnchor.constraint(equalTo: getButton.bottomAnchor),
            furtherButton.heightAnchor.constraint(equalToConstant: 20),
            furtherButton.widthAnchor.constraint(equalToConstant: 20)
            
            
        ])
        
    }
    
    
    
    
}
