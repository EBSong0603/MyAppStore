//
//  CopyrightView.swift
//  myAppStore
//
//  Created by 송은비 on 2020/11/12.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class CopyrightView: ModuleView {
    
    private let copyrightLabel: UILabel = {
        let label = UILabel()
        label.setStyle("Copyright", textColor: .gray, font: UIFont.systemFont(ofSize: 12))
        return label
    }()
    
    private let copyrightInfoLabel: UILabel = {
        let label = UILabel()
        label.setStyle("오늘의 운동", textColor: .black, font: UIFont.systemFont(ofSize: 12))
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
        copyrightInfoLabel.text = "© " + data.artistName
    }
    
    override func configureAutolayouts() {
        
        self.addSubViews([copyrightLabel, copyrightInfoLabel])
        copyrightLabel.top(self.topAnchor)
        copyrightLabel.leading(self.leadingAnchor, constant: 16)
        copyrightLabel.bottom(self.bottomAnchor)
        
        copyrightInfoLabel.centerY(copyrightLabel.centerYAnchor)
        copyrightInfoLabel.trailing(self.trailingAnchor, constant: -16)
    }
}



