//
//  DetailStarRatingViewSecond.swift
//  myAppStore
//
//  Created by 송은비 on 2020/10/19.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit

class DetailStarRatingViewSecond: UIView {
    
    
    private let starImageViewOne: UIImageView = {
           
           let imageView = UIImageView()
           imageView.tintColor = .gray
           imageView.image = UIImage(systemName: "star.fill")
           return imageView
           
       }()
       
       
       private let starImageViewTwo: UIImageView = {
           
           let imageView = UIImageView()
           imageView.tintColor = .gray
           imageView.image = UIImage(systemName: "star.fill")
           
           return imageView
           
       }()
       
       private let starImageViewThree: UIImageView = {
           
           let imageView = UIImageView()
           imageView.tintColor = .gray
           imageView.image = UIImage(systemName: "star.fill")
           return imageView
           
       }()
       
       private let starImageViewFour: UIImageView = {
           
           let imageView = UIImageView()
           imageView.tintColor = .gray
           imageView.image = UIImage(systemName: "star.fill")
           return imageView
           
       }()
       
       
       private let starImageViewFive: UIImageView = {
           
           let imageView = UIImageView()
           imageView.backgroundColor = .white
           imageView.tintColor = .gray
           imageView.image = UIImage(systemName: "star.fill")
           return imageView
           
       }()
       
       private let ratingLabel: UILabel = {
           
           let label = UILabel()
           label.text = "5.0"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
           return label
       }()
       
       
       override init(frame: CGRect) {
           super.init(frame: frame)
        
           configureAutoLayouts()
           self.backgroundColor = .white
         
       }
       
       required init?(coder: NSCoder) {
           super.init(coder: coder)
       }
    
    
    
    
    private func configureAutoLayouts() {
        
    self.addSubview(starImageViewOne)
           self.addSubview(starImageViewTwo)
           self.addSubview(starImageViewThree)
           self.addSubview(starImageViewFour)
           self.addSubview(starImageViewFive)
           self.addSubview(ratingLabel)
           
           starImageViewOne.translatesAutoresizingMaskIntoConstraints = false
           starImageViewTwo.translatesAutoresizingMaskIntoConstraints = false
           starImageViewThree.translatesAutoresizingMaskIntoConstraints = false
           starImageViewFour.translatesAutoresizingMaskIntoConstraints = false
           starImageViewFive.translatesAutoresizingMaskIntoConstraints = false
           ratingLabel.translatesAutoresizingMaskIntoConstraints = false
           
        
        
        NSLayoutConstraint.activate([
        
            ratingLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            ratingLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            ratingLabel.heightAnchor.constraint(equalToConstant: 18),
            ratingLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            
        
        
        ])
           
           
           NSLayoutConstraint.activate([
               
            starImageViewOne.topAnchor.constraint(equalTo: ratingLabel.topAnchor),
            starImageViewOne.leadingAnchor.constraint(equalTo: ratingLabel.trailingAnchor, constant: 4),
            starImageViewOne.centerYAnchor.constraint(equalTo: ratingLabel.centerYAnchor),
               starImageViewOne.heightAnchor.constraint(equalToConstant: 18),
               starImageViewOne.widthAnchor.constraint(equalToConstant: 18)
              
               
               
               
           ])
           
           NSLayoutConstraint.activate([
               
               
               starImageViewTwo.topAnchor.constraint(equalTo: starImageViewOne.topAnchor),
               starImageViewTwo.leadingAnchor.constraint(equalTo: starImageViewOne.trailingAnchor, constant: 1),
               starImageViewTwo.centerYAnchor.constraint(equalTo: starImageViewOne.centerYAnchor),
               starImageViewTwo.heightAnchor.constraint(equalToConstant: 18),
               starImageViewTwo.widthAnchor.constraint(equalToConstant: 18),
               starImageViewTwo.bottomAnchor.constraint(equalTo: starImageViewOne.bottomAnchor)
               
           ])
           
           
           
           NSLayoutConstraint.activate([
               
               starImageViewThree.topAnchor.constraint(equalTo: starImageViewTwo.topAnchor),
               starImageViewThree.leadingAnchor.constraint(equalTo: starImageViewTwo.trailingAnchor, constant: 1),
               starImageViewThree.centerYAnchor.constraint(equalTo: starImageViewTwo.centerYAnchor),
               starImageViewThree.heightAnchor.constraint(equalToConstant: 18),
               starImageViewThree.widthAnchor.constraint(equalToConstant: 18),
               starImageViewThree.bottomAnchor.constraint(equalTo: starImageViewTwo.bottomAnchor)
               
               
           ])
           
           
           NSLayoutConstraint.activate([
               
               starImageViewFour.topAnchor.constraint(equalTo: starImageViewThree.topAnchor),
               starImageViewFour.leadingAnchor.constraint(equalTo: starImageViewThree.trailingAnchor, constant: 1),
               starImageViewFour.centerYAnchor.constraint(equalTo: starImageViewThree.centerYAnchor),
               starImageViewFour.heightAnchor.constraint(equalToConstant: 18),
               starImageViewFour.widthAnchor.constraint(equalToConstant: 18),
               starImageViewFour.bottomAnchor.constraint(equalTo: starImageViewThree.bottomAnchor)
               
               
           ])
           
           
           NSLayoutConstraint.activate([
               
               starImageViewFive.topAnchor.constraint(equalTo: starImageViewFour.topAnchor),
               starImageViewFive.leadingAnchor.constraint(equalTo: starImageViewFour.trailingAnchor, constant: 1),
               starImageViewFive.centerYAnchor.constraint(equalTo: starImageViewFour.centerYAnchor),
               
              
               starImageViewFive.heightAnchor.constraint(equalToConstant: 18),
               starImageViewFive.widthAnchor.constraint(equalToConstant: 18),
               starImageViewFive.bottomAnchor.constraint(equalTo: starImageViewFour.bottomAnchor)
               
               
           ])
           
        
        
    }
    
    
}
