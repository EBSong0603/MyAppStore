//  FirstSearchPageTableViewCell.swift
//  myAppStore
//  Created by 송은비 on 2020/10/17.
//  Copyright © 2020 EB. All rights reserved.

import UIKit

class SearchTableViewCell: BaseTableViewCell, Cellable {
    
    static var identifier: String = SearchTableViewCell.identifierString
    
    private let searchAppInfoView = SearchAppIconInfoView()

    private let captureImageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.setStackViewStyle(axis: .horizontal, spacing: 5, distribution: .fillEqually)
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(with cellData: AppStoreModel.ResultsEntry?) {
        
        guard let cellData = cellData else {return}
        searchAppInfoView.setData(with: cellData)
        
        let urls = cellData.screenshotUrls.makeFilteredStringArray(count: 2)
        
        captureImageStackView.removeAllSubViews()
        var myView: [UIImageView] = []
        
        urls.forEach { url in
            let imageView = UIImageView()
            imageView.setImageViewStyle(nil, radius: 5, contentMode: .scaleAspectFill)
            ImageCacheManager.load(with: url, imageView: imageView)
            myView.append(imageView)
            imageView.height(210)
        }
        captureImageStackView.addArrangedSubviews(myView)
    }
    
    override func configureAutolayouts() {
        
        contentView.addSubview(searchAppInfoView)
        contentView.addSubview(captureImageStackView)
        
        searchAppInfoView.top(contentView.topAnchor, constant: 4)
        searchAppInfoView.leading(contentView.leadingAnchor)
        searchAppInfoView.trailing(contentView.trailingAnchor)
        
        captureImageStackView.top(searchAppInfoView.bottomAnchor, constant: 4)
        captureImageStackView.leading(searchAppInfoView.leadingAnchor, constant: 16)
        captureImageStackView.trailing(searchAppInfoView.trailingAnchor, constant: -16)
        captureImageStackView.bottom(contentView.bottomAnchor, constant: -4)
    }
}
