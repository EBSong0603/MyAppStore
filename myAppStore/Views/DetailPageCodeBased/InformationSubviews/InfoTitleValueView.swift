//  InfoTitleValueView.swift
//  myAppStore
//  Created by 송은비 on 2020/11/18.
//  Copyright © 2020 EB. All rights reserved.

import UIKit

class InfoTitleValueView: ModuleView {
    
    private let infoTitleLabel: BasicComponentLabel = {
        let label = BasicComponentLabel(labelStyle: .system12)
        label.setStyle(title: "제공자", color: .gray)
        return label
    }()
    
    let infoValueLabel: BasicComponentLabel = {
        let label = BasicComponentLabel(labelStyle: .system12)
        label.setStyle(title: "아무개", color: .black)
        return label
    }()
    
    let arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.down")!
        imageView.tintColor = .gray
        imageView.width(20)
        imageView.height(20)
        return imageView
    }()
    
    private var infoValueLabelConstraint: NSLayoutConstraint!
    
    private var con1: NSLayoutConstraint? = nil
    private var con2: NSLayoutConstraint? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        willChangedConstraintSet()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func willChangedConstraintSet() {
//        con1 = infoValueLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
//        con1?.isActive = true
//        con1?.priority = UILayoutPriority(rawValue: 500)
//
//        con2 = infoValueLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50)
//        con2?.isActive = true
//        con2?.priority = UILayoutPriority(rawValue: 250)
        
        if infoValueLabelConstraint == nil {
            infoValueLabelConstraint = infoValueLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
            infoValueLabelConstraint.isActive = true
        }
    }
    
    func setData(with item: InfoItem) {
        infoTitleLabel.text = item.title
        infoValueLabel.text = item.value
        
        if let icon = item.icon {
            arrowImageView.image = icon
            infoTitleLabel.textColor = .systemBlue
            arrowImageView.tintColor = .systemBlue
        } else {
            if item.isArrow == true {
                arrowImageView.image = UIImage(systemName: "chevron.down")!
                infoValueLabelConstraint.constant = -50
                //                con2?.priority = .defaultHigh
                
            } else {
                arrowImageView.isHidden = true
                infoValueLabelConstraint.constant = -16
                //                con2?.priority = .defaultLow
            }
        }
    }
    
    override func configureAutolayouts() {
        
        self.addSubViews([infoTitleLabel, infoValueLabel, arrowImageView])
        infoTitleLabel.top(self.topAnchor, constant: 10)
        infoTitleLabel.leading(self.leadingAnchor, constant: 16)
        infoTitleLabel.bottom(self.bottomAnchor, constant: -10)
        
        infoValueLabel.centerY(infoTitleLabel.centerYAnchor)
        
        arrowImageView.centerY(infoTitleLabel.centerYAnchor)
        arrowImageView.trailing(self.trailingAnchor, constant: -16)
    }
}
