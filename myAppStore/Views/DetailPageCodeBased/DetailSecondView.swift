//
//  SecondShortInformView.swift
//  myAppStore
//
//  Created by 송은비 on 2020/10/17.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit

class DetailSecondView: UIView {
    
    
    
    private let ratingStackView: UIStackView = {
        

    
        let ratingView: DetailStarRatingViewSecond = {
           let view = DetailStarRatingViewSecond()
            
            return view
            
        }()
        
        
        
        let reviewCountLabel: UILabel = {
            let label = UILabel()
            label.text = "256 Ratings"
            label.textColor = .lightGray
            label.font = UIFont.systemFont(ofSize: 12)
            return label
            
        }()
        
        
        
        let stackView = UIStackView(arrangedSubviews: [ratingView, reviewCountLabel])
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
            label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
            
            return label
            
        }()
        
        let categoryLabel: UILabel = {
            let label = UILabel()
            label.text = "여행"
            label.textColor = .lightGray
            label.font = UIFont.systemFont(ofSize: 12)
            return label
            
        }()
        let stackView = UIStackView(arrangedSubviews: [countLabel, categoryLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 2
     
        return stackView
        
    }()
    
    
    private let ageStackView: UIStackView = {
        
        
        let ageLabel: UILabel = {
            
            let label = UILabel()
            
            label.text = "17+"
            label.textColor = .gray
            label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
            return label
        }()
        
        
        let infoLabel: UILabel = {
            
            let label = UILabel()
            
            label.text = "Age"
            label.textColor = .lightGray
            label.font = UIFont.systemFont(ofSize: 12)
            return label
        }()
        
        
        let stackView = UIStackView(arrangedSubviews: [ageLabel, infoLabel])
        stackView.distribution = .fillEqually
        stackView.spacing = 2
        stackView.axis = .vertical
    
        return stackView
        
        
    }()
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.heightAnchor.constraint(equalToConstant: 60).isActive = true
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
            
            ratingStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
//                        ratingStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            
            
        ])
        
        NSLayoutConstraint.activate([
            
            
//            similarInformStackView.topAnchor.constraint(equalTo: ratingStackView.topAnchor),
            similarInformStackView.leadingAnchor.constraint(equalTo: ratingStackView.trailingAnchor, constant: 120),
            similarInformStackView.centerYAnchor.constraint(equalTo: ratingStackView.centerYAnchor)
//            similarInformStackView.bottomAnchor.constraint(equalTo: ratingStackView.bottomAnchor)
            
            
        ])
        
        NSLayoutConstraint.activate([
            
//            ageStackView.topAnchor.constraint(equalTo: similarInformStackView.topAnchor),
            
            
            ageStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            ageStackView.centerYAnchor.constraint(equalTo: similarInformStackView.centerYAnchor)
//            ageStackView.bottomAnchor.constraint(equalTo: similarInformStackView.bottomAnchor)
            
            
        ])
        
    }
    
    
    
}
