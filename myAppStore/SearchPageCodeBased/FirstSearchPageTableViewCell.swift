//
//  FirstSearchPageTableViewCell.swift
//  myAppStore
//
//  Created by 송은비 on 2020/10/17.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit

class FirstSearchPageTableViewCell: UITableViewCell {
    
    
    static let identifier = "FirstSearchPageTableViewCell"
    
    
    private let firstView: FirstAppInformationView = {
        
        let view = FirstAppInformationView()
        
        
        return view
    }()
    
    private let secondView: SecondAppInformationView = {
        
        let view = SecondAppInformationView()
        return view
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        confiureAutoLayouts()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    
    private func confiureAutoLayouts() {
        
        
        contentView.addSubview(firstView)
        contentView.addSubview(secondView)
        
        firstView.translatesAutoresizingMaskIntoConstraints = false
        secondView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            firstView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            firstView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            firstView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4)
            
            
            
        ])
        
        
        NSLayoutConstraint.activate([
            
            secondView.topAnchor.constraint(equalTo: firstView.bottomAnchor, constant: 4),
            secondView.leadingAnchor.constraint(equalTo: firstView.leadingAnchor),
            secondView.trailingAnchor.constraint(equalTo: firstView.trailingAnchor),
            secondView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4)
            
            
        ])
        
        
    }
    
}
