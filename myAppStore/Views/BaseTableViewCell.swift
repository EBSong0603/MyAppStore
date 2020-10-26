//
//  BaseTableViewCell.swift
//  myAppStore
//
//  Created by 송은비 on 2020/10/26.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell, Viewable {
  
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureAutolayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureAutolayouts() {
        
    }
    
    
}
