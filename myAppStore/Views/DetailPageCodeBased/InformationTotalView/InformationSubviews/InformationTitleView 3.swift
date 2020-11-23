//
//  InformationTitleView.swift
//  myAppStore
//
//  Created by 송은비 on 2020/11/12.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class InformationTitleView: ModuleView {
    
    private let informationtitleLabel: UILabel = {
        let label = UILabel()
        label.setStyle("Information", textColor: .black, font: UIFont.systemFont(ofSize: 20, weight: .bold))
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureAutolayouts() {
        self.addSubview(informationtitleLabel)
        informationtitleLabel.edges(self, vConstant: 0, hConstant: 16)
    }
}
