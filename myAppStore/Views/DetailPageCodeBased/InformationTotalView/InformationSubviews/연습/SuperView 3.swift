//
//  SuperView.swift
//  myAppStore
//
//  Created by 송은비 on 2020/11/13.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit

class SuperView: ModuleView {
    
  
    private let vStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.setStackViewStyle(axis: .vertical, spacing: 0, distribution: .fillEqually)
        return stackView
    }()
    
    private let myButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .clear
     
        return button
    }()
    
    private let view1: TestView1 = TestView1()
    private let view2: TestView2 = TestView2()

    private let testLabel1: UILabel = {
       let label = UILabel()
        label.setStyle("TestLabel1", textColor: .gray, font: UIFont.systemFont(ofSize: 12))
        return label
    }()

    private let testLabel2: UILabel = {
       let label = UILabel()
        label.setStyle("TestLabel1", textColor: .gray, font: UIFont.systemFont(ofSize: 12))
        return label
    }()

            
            override init(frame: CGRect) {
                super.init(frame: frame)
                self.backgroundColor = .white
                vStackView.addArrangedSubviews([testLabel1, testLabel2])

                testLabel2.isHidden = true

                myButton.addTarget(self, action: #selector(myButtonClicked), for: .touchUpInside)
            }
            
            required init?(coder: NSCoder) {
                fatalError("init(coder:) has not been implemented")
            }
    
   @objc private func myButtonClicked() {
    testLabel2.isHidden = !testLabel2.isHidden
    
    }
            
            
            override func configureAutolayouts() {

                self.addSubview(vStackView)
                self.addSubview(myButton)
                vStackView.edges(self)
                myButton.edges(self)
        
                
 
            }
            
    
}
