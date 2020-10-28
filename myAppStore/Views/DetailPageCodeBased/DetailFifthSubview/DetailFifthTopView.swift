//
//  practice.swift
//  myAppStore
//
//  Created by 송은비 on 2020/10/28.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit

class DetailFifthTopView: ModuleView {
    
 
    private let shortInfoLabel: UILabel = {
        
       let label = UILabel()
        label.setStyle("dddddd", textColor: .black, font: UIFont.systemFont(ofSize: 15))
        return label
    }()
    

    
     let moreInfoLabel: UILabel = {
        
       let label = UILabel()
        label.setStyle("더보기", textColor: .black, font: UIFont.systemFont(ofSize: 15))
        return label
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
    
    
    override func configureAutolayouts() {
        
        self.addSubview(shortInfoLabel)
        self.addSubview(moreInfoLabel)
        
        shortInfoLabel.top(self.topAnchor, constant: 4)
        shortInfoLabel.leading(self.leadingAnchor, constant: 4)
        shortInfoLabel.bottom(self.bottomAnchor, constant: -4)
        
        moreInfoLabel.top(shortInfoLabel.topAnchor)
        moreInfoLabel.leading(shortInfoLabel.trailingAnchor)
        moreInfoLabel.bottom(shortInfoLabel.bottomAnchor)
        moreInfoLabel.trailing(self.trailingAnchor)
    }
}
