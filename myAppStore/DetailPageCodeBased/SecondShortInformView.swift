//
//  SecondShortInformView.swift
//  myAppStore
//
//  Created by 송은비 on 2020/10/17.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit

class SecondShortInformView: UIView {
    
    
    
    private let ratingStackView: UIStackView = {
        
        let someLabel: UILabel = {
            let label = UILabel()
            label.text = "별점별점"
            label.textColor = .lightGray
            label.font = UIFont.systemFont(ofSize: 16)
            return label
            
        }()
        
        let reviewCountLabel: UILabel = {
            let label = UILabel()
            label.text = "256 Ratings"
            label.textColor = .lightGray
            label.font = UIFont.systemFont(ofSize: 10)
            return label
            
        }()
        
        
        
        let stackView = UIStackView(arrangedSubviews: [someLabel, reviewCountLabel])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 0
        
        return stackView
    }()
    
    
    
    private let similarInformStackView: UIStackView = {
        
        let countLabel: UILabel = {
            let label = UILabel()
            label.text = "No 40"
            label.textColor = .gray
            label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            
            return label
            
        }()
        
        let categoryLabel: UILabel = {
            let label = UILabel()
            label.text = "여행"
            label.textColor = .lightGray
            label.font = UIFont.systemFont(ofSize: 10)
            return label
            
        }()
        let stackView = UIStackView(arrangedSubviews: [countLabel, categoryLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
        
    }()
    
    
    private let ageStackView: UIStackView = {
        
        
        let ageLabel: UILabel = {
            
            let label = UILabel()
            
            label.text = "17+"
            label.textColor = .gray
            label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            return label
        }()
        
        
        let infoLabel: UILabel = {
            
            let label = UILabel()
            
            label.text = "Age"
            label.textColor = .lightGray
            label.font = UIFont.systemFont(ofSize: 10)
            return label
        }()
        
        
        let stackView = UIStackView(arrangedSubviews: [ageLabel, infoLabel])
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        stackView.axis = .vertical
        return stackView
        
        
    }()
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureAutoLayouts()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    
    
    private func configureAutoLayouts() {
        
        self.addSubview(ratingStackView)
        self.addSubview(similarInformStackView)
        self.addSubview(ageStackView)
        
        ratingStackView.translatesAutoresizingMaskIntoConstraints = false
        similarInformStackView.translatesAutoresizingMaskIntoConstraints = false
        ageStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            ratingStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            ratingStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
            
            ratingStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4)
            //            ratingStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            
            
        ])
        
        NSLayoutConstraint.activate([
            
            
            similarInformStackView.topAnchor.constraint(equalTo: ratingStackView.topAnchor),
            similarInformStackView.leadingAnchor.constraint(equalTo: ratingStackView.trailingAnchor, constant: 60),
            similarInformStackView.bottomAnchor.constraint(equalTo: ratingStackView.bottomAnchor)
            
            
        ])
        
        NSLayoutConstraint.activate([
            
            ageStackView.topAnchor.constraint(equalTo: similarInformStackView.topAnchor),
            
            
            ageStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4),
            ageStackView.bottomAnchor.constraint(equalTo: similarInformStackView.bottomAnchor)
            
            
        ])
        
    }
    
    
    
}
