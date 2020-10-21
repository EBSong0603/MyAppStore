//
//  StarRatingView.swift
//  myAppStore
//
//  Created by 송은비 on 2020/10/17.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit

class StarRatingView: UIView {
    
    static let identifier = "StarRatingView"
    
    private let starFirstImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.tintColor = .gray
        imageView.image = UIImage(systemName: "star")
        return imageView
        
    }()
    
    
    private let starSecondImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.tintColor = .gray
        imageView.image = UIImage(systemName: "star")
        
        return imageView
        
    }()
    
    private let starThirdImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.tintColor = .gray
        imageView.image = UIImage(systemName: "star")
        return imageView
        
    }()
    
    private let starForthImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.tintColor = .gray
        imageView.image = UIImage(systemName: "star")
        return imageView
        
    }()
    
    
    private let starFifthImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.tintColor = .gray
        imageView.image = UIImage(systemName: "star")
        return imageView
        
    }()
    
    private let ratingLabel: UILabel = {
        
        let label = UILabel()
        label.text = "222"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 12)
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
        
        self.addSubview(starFirstImageView)
        self.addSubview(starSecondImageView)
        self.addSubview(starThirdImageView)
        self.addSubview(starForthImageView)
        self.addSubview(starFifthImageView)
        self.addSubview(ratingLabel)
        
        starFirstImageView.translatesAutoresizingMaskIntoConstraints = false
        starSecondImageView.translatesAutoresizingMaskIntoConstraints = false
        starThirdImageView.translatesAutoresizingMaskIntoConstraints = false
        starForthImageView.translatesAutoresizingMaskIntoConstraints = false
        starFifthImageView.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            starFirstImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            starFirstImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 1),
            starFirstImageView.heightAnchor.constraint(equalToConstant: 12),
            starFirstImageView.widthAnchor.constraint(equalToConstant: 12),
            starFirstImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4)
            
            
            
        ])
        
        NSLayoutConstraint.activate([
            
            
            starSecondImageView.leadingAnchor.constraint(equalTo: starFirstImageView.trailingAnchor, constant: 2),
            starSecondImageView.centerYAnchor.constraint(equalTo: starFirstImageView.centerYAnchor),
            starSecondImageView.heightAnchor.constraint(equalToConstant: 12),
            starSecondImageView.widthAnchor.constraint(equalToConstant: 12)
            
        ])
        
        
        
        NSLayoutConstraint.activate([
            
            starThirdImageView.leadingAnchor.constraint(equalTo: starSecondImageView.trailingAnchor, constant: 2),
            starThirdImageView.centerYAnchor.constraint(equalTo: starSecondImageView.centerYAnchor),
            starThirdImageView.heightAnchor.constraint(equalToConstant: 12),
            starThirdImageView.widthAnchor.constraint(equalToConstant: 12)
            
            
        ])
        
        
        NSLayoutConstraint.activate([
            
            starForthImageView.leadingAnchor.constraint(equalTo: starThirdImageView.trailingAnchor, constant: 2),
            starForthImageView.centerYAnchor.constraint(equalTo: starThirdImageView.centerYAnchor),
            starForthImageView.heightAnchor.constraint(equalToConstant: 12),
            starForthImageView.widthAnchor.constraint(equalToConstant: 12)
            
            
        ])
        
        
        NSLayoutConstraint.activate([
            
            starFifthImageView.leadingAnchor.constraint(equalTo: starForthImageView.trailingAnchor, constant: 2),
            starFifthImageView.centerYAnchor.constraint(equalTo: starForthImageView.centerYAnchor),
            starFifthImageView.heightAnchor.constraint(equalToConstant: 12),
            starFifthImageView.widthAnchor.constraint(equalToConstant: 12)
            
            
        ])
        
        NSLayoutConstraint.activate([
            
            ratingLabel.leadingAnchor.constraint(equalTo: starFifthImageView.trailingAnchor, constant: 4),
            ratingLabel.centerYAnchor.constraint(equalTo: starFifthImageView.centerYAnchor),
            ratingLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -2)
            
            
        ])
    }
    
    
    
    
}
