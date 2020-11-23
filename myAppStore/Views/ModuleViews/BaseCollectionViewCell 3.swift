//  BaseCell.swift
//  myAppStore
//  Created by 송은비 on 2020/10/26.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class BaseCollectionViewCell: UICollectionViewCell, Viewable {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureAutolayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureAutolayouts() {
    }
}
