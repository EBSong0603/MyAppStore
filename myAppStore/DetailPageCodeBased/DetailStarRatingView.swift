//
//  DetailThirdView.swift
//  myAppStore
//
//  Created by 송은비 on 2020/10/19.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit


class DetailStarRatingView: UIView {
    
 
      
    
    private let contentStackView: UIStackView = {
        
        
         let starFirstImageView: UIImageView = {
              
              let imageView = UIImageView()
              imageView.tintColor = .lightGray
              imageView.image = UIImage(systemName: "star")
            imageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
              return imageView
              
          }()
          
          
           let starSecondImageView: UIImageView = {
              
              let imageView = UIImageView()
              imageView.tintColor = .lightGray
              imageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
                      imageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
              imageView.image = UIImage(systemName: "star")
              
              return imageView
              
          }()
          
           let starThirdImageView: UIImageView = {
              
              let imageView = UIImageView()
              imageView.tintColor = .lightGray
              imageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
                      imageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
              imageView.image = UIImage(systemName: "star")
              return imageView
              
          }()
          
           let starForthImageView: UIImageView = {
              
              let imageView = UIImageView()
              imageView.tintColor = .lightGray
             imageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
                      imageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
              imageView.image = UIImage(systemName: "star")
              return imageView
              
          }()
          
          
           let starFifthImageView: UIImageView = {
              
              let imageView = UIImageView()
              imageView.tintColor = .lightGray
              imageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
                      imageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
              imageView.image = UIImage(systemName: "star")
              return imageView
              
          }()
          
           let ratingLabel: UILabel = {
              
              let label = UILabel()
              label.text = "5gg"
            label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            label.heightAnchor.constraint(equalToConstant: 14).isActive = true
            label.widthAnchor.constraint(equalToConstant: 40).isActive = true
            label.textColor = .gray
              return label
          }()
          
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        let stackView = UIStackView(arrangedSubviews: [ratingLabel, starFirstImageView, starSecondImageView, starThirdImageView, starForthImageView, starFifthImageView])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        
        return stackView
        
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
      configureAutoLayOuts()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    
    
    private func configureAutoLayOuts() {
        
        
        self.addSubview(contentStackView)
        
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
        
            contentStackView.topAnchor.constraint(equalTo: self.topAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
    
        
        
        ])
        
        
        
    }
    
    
}
