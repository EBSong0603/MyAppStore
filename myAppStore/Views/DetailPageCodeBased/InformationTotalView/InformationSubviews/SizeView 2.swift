//
//  SizeView.swift
//  myAppStore
//
//  Created by 송은비 on 2020/11/12.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class SizeView: ModuleView {
    
    private let sizeLabel: UILabel = {
        let label = UILabel()
        label.setStyle("Size", textColor: .gray, font: UIFont.systemFont(ofSize: 12))
        return label
    }()
    
    private let sizeInfoLabel: UILabel = {
        let label = UILabel()
        label.setStyle("57.4 MB", textColor: .black, font: UIFont.systemFont(ofSize: 12))
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(with data: AppStoreModel.ResultsEntry) {
        let intSize = round((data.fileSizeBytes.toDouble) / 1000000)
        sizeInfoLabel.text = "\(intSize) MB"
    }
    
    override func configureAutolayouts() {
        
        self.addSubViews([sizeLabel, sizeInfoLabel])
        sizeLabel.top(self.topAnchor)
        sizeLabel.leading(self.leadingAnchor, constant: 16)
        sizeLabel.bottom(self.bottomAnchor)
        
        sizeInfoLabel.centerY(sizeLabel.centerYAnchor)
        sizeInfoLabel.trailing(self.trailingAnchor, constant: -16)
    }
}


