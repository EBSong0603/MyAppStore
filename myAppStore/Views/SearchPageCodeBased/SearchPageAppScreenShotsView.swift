//  SecondAppInformationView.swift
//  myAppStore
//  Created by 송은비 on 2020/10/17.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class SearchPageAppScreenShotsView: ModuleView {
   
    private let captureImageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.setStackViewStyle(axis: .horizontal, spacing: 5, distribution: .fillEqually)
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setData(_ urls: [String]) {
        
        captureImageStackView.removeAllSubViews()
        var myView: [UIImageView] = []

        urls.forEach { url in
            let imageView = UIImageView()
            imageView.load(with: url)
            myView.append(imageView)
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 7
        }
        captureImageStackView.addArrangedSubviews(myView)
    }
 
    override func configureAutolayouts() {
        self.addSubview(captureImageStackView)
        captureImageStackView.edges(self, vConstant: 4, hConstant: 16)
        captureImageStackView.height(180)
    }
}


