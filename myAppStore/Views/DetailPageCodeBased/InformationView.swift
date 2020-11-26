//  InformationView.swift
//  myAppStore
//  Created by 송은비 on 2020/11/12.
//  Copyright © 2020 EB. All rights reserved.

import UIKit

class InformationView: ModuleView {
    
    private let infoTotalVStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.setStackViewStyle(axis: .vertical, spacing: 5, distribution: .fill)
        return stackView
    }()
    private let infoTitleValueView = InfoTitleValueView()
    private let descriptionLabel: BasicComponentLabel = {
        let label = BasicComponentLabel(labelStyle: .system12)
        label.setStyle(title: "디스크립션", color: UIColor(named: "ColorSetBlack")!)
        label.numberOfLines = 0
        return label
    }()
    
    private let openButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setItem(with item: InfoItem) {
        
        infoTitleValueView.setItem(with: item)
        infoTotalVStackView.addArrangedSubview(infoTitleValueView)
        
        if item.isArrow == true {
            infoTotalVStackView.addArrangedSubview(descriptionLabel)
            
            descriptionLabel.text = item.description
            descriptionLabel.isHidden = true
            self.addSubview(openButton)
            openButton.addTarget(self, action: #selector(openButtonClicked), for: .touchUpInside)
            openButton.edges(self)
        }
    }
    
    @objc func openButtonClicked() {
        descriptionLabel.isHidden = false
        
        UIView.transition(with: self.descriptionLabel, duration: 0.1, options: .transitionCrossDissolve, animations: {
            self.infoTitleValueView.infoValueLabel.alpha = 0
            self.infoTitleValueView.arrowImageView.isHidden = true
        })
    }
    
    override func configureAutolayouts() {
        
        self.addSubview(infoTotalVStackView)
        
        infoTotalVStackView.top(self.topAnchor)
        infoTotalVStackView.leading(self.leadingAnchor, constant: 16)
        infoTotalVStackView.trailing(self.trailingAnchor, constant: -16)
        infoTotalVStackView.bottom(self.bottomAnchor)
    }
}
