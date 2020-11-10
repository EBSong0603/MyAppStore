//
//  DetailFifthViewBottomView.swift
//  myAppStore
//
//  Created by 송은비 on 2020/11/09.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit

class DetailFifthViewBottmView: ModuleView {
    
     let longLabel: UILabel = {
        let label = UILabel()
        label.setStyle("dkdkdkdk", textColor: .black, font: UIFont.systemFont(ofSize: 12))
        label.numberOfLines = 0
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
        self.addSubview(longLabel)
        longLabel.edges(self)
    }
}
