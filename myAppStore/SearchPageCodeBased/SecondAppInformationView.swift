//
//  SecondAppInformationView.swift
//  myAppStore
//
//  Created by 송은비 on 2020/10/17.
//  Copyright © 2020 EB. All rights reserved.
//


import UIKit
import Foundation


class SecondAppInformationView: UIView {
    
    
    
    static let identifier = "SecondAppInformationView"
    
    private let captureImageStackView: UIStackView = {
        
        
        let captureImaeViewOne: UIImageView = {
            
            let imageView = UIImageView()
            imageView.backgroundColor = .yellow
            imageView.image = UIImage(named: "이미지")
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 7
            
            return imageView
        }()
        
        let captureImaeViewTwo: UIImageView = {
            
            let imageView = UIImageView()
            imageView.backgroundColor = .yellow
            imageView.image = UIImage(named: "이미지")
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 7
            
            return imageView
        }()
        
        let captureImaeViewThree: UIImageView = {
            
            let imageView = UIImageView()
            imageView.backgroundColor = .yellow
            imageView.image = UIImage(named: "이미지")
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 7
            
            return imageView
        }()
        
        
        
        let stackView = UIStackView(arrangedSubviews:[captureImaeViewOne,
                                                      captureImaeViewTwo,
                                                      captureImaeViewThree])
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
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
        
        self.addSubview(captureImageStackView)
        
        captureImageStackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            
            captureImageStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            captureImageStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            captureImageStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            captureImageStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4)
            
            
        ])
    }
    
}


