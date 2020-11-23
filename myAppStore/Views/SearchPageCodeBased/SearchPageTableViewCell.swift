//  FirstSearchPageTableViewCell.swift
//  myAppStore
//  Created by 송은비 on 2020/10/17.
//  Copyright © 2020 EB. All rights reserved.

import UIKit

class SearchPageTableViewCell: BaseTableViewCell, Cellable {
    
    static var identifier: String = SearchPageTableViewCell.identifierString
    private let firstView = SearchPageAppIconInfoView()
    private let secondView = SearchPageAppScreenShotsView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(with cellData: AppStoreModel.ResultsEntry?) {
        
        guard let cellData = cellData else {return}
        firstView.setData(with: cellData)
        secondView.setData(cellData.screenshotUrls.makeFilteredStringArray( count: 2))
    }
    
    override func configureAutolayouts() {
        contentView.addSubview(firstView)
        contentView.addSubview(secondView)
        
        firstView.top(contentView.topAnchor, constant: 4)
        firstView.leading(contentView.leadingAnchor)
        firstView.trailing(contentView.trailingAnchor)
        
        secondView.top(firstView.bottomAnchor, constant: 4)
        secondView.leading(firstView.leadingAnchor)
        secondView.trailing(firstView.trailingAnchor)
        secondView.bottom(contentView.bottomAnchor, constant: -4)
    }
}
