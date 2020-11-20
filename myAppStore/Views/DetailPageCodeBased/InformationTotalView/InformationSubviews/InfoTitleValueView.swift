//  InfoTitleValueView.swift
//  myAppStore
//  Created by 송은비 on 2020/11/18.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class InfoTitleValueView: ModuleView {

    private let infoTitleLabel: UILabel = {
       let label = UILabel()
        label.setStyle("제공자", textColor: .gray, font: UIFont.systemFont(ofSize: 12))
        return label
    }()
    
      let infoValueLabel: UILabel = {
       let label = UILabel()
        label.setStyle("kakao", textColor: .black, font: UIFont.systemFont(ofSize: 12))
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(with item: InformationItem) {
        infoTitleLabel.text = item.title
        infoValueLabel.text = item.value
       
        if infoValueLabelConstraint == nil {
            infoValueLabelConstraint = infoValueLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor
                                                                                , constant: 0)
            infoValueLabelConstraint.isActive = true
        }

        if let icon = item.icon {
            arrowImageView.image = icon
            infoTitleLabel.textColor = .systemBlue
            arrowImageView.tintColor = .systemBlue
        } else {
            if item.isArrow == true {
                arrowImageView.image = UIImage(systemName: "chevron.down")!
                
                infoValueLabelConstraint.constant = -50
            } else {
                arrowImageView.isHidden = true
                infoValueLabelConstraint.constant = -16
            }
        }
    }
    
    override func configureAutolayouts() {
        self.addSubViews([infoTitleLabel, infoValueLabel, arrowImageView])
        infoTitleLabel.top(self.topAnchor, constant: 9)
        infoTitleLabel.leading(self.leadingAnchor, constant: 16)
        infoTitleLabel.bottom(self.bottomAnchor, constant: -9)
        
        infoValueLabel.centerY(infoTitleLabel.centerYAnchor)

        arrowImageView.centerY(infoTitleLabel.centerYAnchor)
        arrowImageView.trailing(self.trailingAnchor, constant: -16)
    }
}
