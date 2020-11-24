//  InformationView.swift
//  myAppStore
//  Created by 송은비 on 2020/11/12.
//  Copyright © 2020 EB. All rights reserved.

import UIKit

class InformationTotalView: ModuleView {

    private let infoTotalVStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.setStackViewStyle(axis: .vertical, spacing: 5, distribution: .fill)
        return stackView
    }()
    
    private let informationtitleLabel: BasicComponentLabel = {
        let label = BasicComponentLabel(labelStyle: .system20B)
        label.setStyle(title: "정보", color: .black)
        return label
    }()
    
    private let infoTitleValueView = InfoTitleValueView()
    

    private let infoItems = informationItems()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(with data: AppStoreModel.ResultsEntry) {
        
        infoItems.setData(with: data)
        
        
        
        let items = infoItems.items
        
        for item in items {
        
           
            let separator = HorizonSeperatorView()
            let infoView = InfoTitleValueView()
            infoView.setData(with: item)
            
            infoTotalVStackView.addArrangedSubview(infoView)
            infoTotalVStackView.addArrangedSubview(separator)
            
//
//            let openButton = UIButton()
//
////            var isTapped: ((Bool) -> Void)?
////
//            let descriptionLabel = UILabel()
//            descriptionLabel.font = .systemFont(ofSize: 12)
//            descriptionLabel.numberOfLines = 0
//            descriptionLabel.text = item.description
//
//
//            if item.isArrow {
//                infoTotalVStackView.addArrangedSubview(infoView)
//                infoTotalVStackView.addArrangedSubview(descriptionLabel)
//                infoTotalVStackView.addArrangedSubview(separator)
//                self.addSubview(openButton)
//                descriptionLabel.isHidden = true
//
//            } else {
//                infoTotalVStackView.addArrangedSubview(infoView)
//                infoTotalVStackView.addArrangedSubview(separator)
//            }
//
//
        }
        
    }

    
    override func configureAutolayouts() {
        
        self.addSubview(infoTotalVStackView)
//        self.addSubview(informationtitleLabel)
//
//        informationtitleLabel.top(self.topAnchor)
//        informationtitleLabel.leading(self.leadingAnchor, constant: 16)
//        informationtitleLabel.trailing(self.trailingAnchor)
        
        infoTotalVStackView.edges(self)
//        infoTotalVStackView.top(informationtitleLabel.bottomAnchor, constant: 8)
//        infoTotalVStackView.leading(self.leadingAnchor)
//        infoTotalVStackView.trailing(self.trailingAnchor)
//        infoTotalVStackView.bottom(self.bottomAnchor)
    }
}
