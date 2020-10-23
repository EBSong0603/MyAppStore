//
//  SecondAppInformationView.swift
//  myAppStore
//
//  Created by 송은비 on 2020/10/17.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class SecondAppInformationView: UIView {

    static let identifier = "SecondAppInformationView"
    
    private let captureImageStackView: UIStackView = {
        let stackView = UIStackView()
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

    func setImageViews(_ urls: [String]) {
      
        for url in urls {
            let imageView = UIImageView()
            imageView.load(with: url)
            
            //extension 활용
//            guard let imageURL = URL(string: url) else {return}
//            DispatchQueue.global().async {
//                guard let imageData = try? Data(contentsOf: imageURL) else {return}
//                let image = UIImage(data: imageData)
//                DispatchQueue.main.async {
//                    imageView.image = image
//
//                }
//            }
                imageView.clipsToBounds = true
                imageView.layer.cornerRadius = 7
 
            captureImageStackView.addArrangedSubview(imageView)
        }
    }
    
    private func configureAutoLayouts() {
        self.addSubview(captureImageStackView)
   
        captureImageStackView.edges(self, vConstant: 4, hConstant: 16)
        captureImageStackView.height(200)
    }
    
}


