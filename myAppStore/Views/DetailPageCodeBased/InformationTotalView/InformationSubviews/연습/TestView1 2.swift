//
//  agerating.swift
//  myAppStore
//
//  Created by 송은비 on 2020/11/13.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit

class TestView1: ModuleView {
 
private let ageRatingLabel: UILabel = {
   let label = UILabel()
    label.setStyle("TestLabel1", textColor: .gray, font: UIFont.systemFont(ofSize: 12))
    return label
}()

     let myButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func configureAutolayouts() {
//        self.addSubViews([ageRatingLabel])
//        ageRatingLabel.edges(self)
//        ageRatingLabel.edges(self)
//        myButton.edges(ageRatingLabel)

        
        self.addSubview(ageRatingLabel)
        self.addSubview(myButton)
        ageRatingLabel.edges(self)
        myButton.edges(self)
    }
}
