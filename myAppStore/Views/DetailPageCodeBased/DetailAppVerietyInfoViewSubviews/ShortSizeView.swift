//  DetailSecondViewSixthView.swift
//  myAppStore
//  Created by 송은비 on 2020/11/09.
//  Copyright © 2020 EB. All rights reserved.

import UIKit

class ShortSizeView: ModuleView {
    
    private let sizeVStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.setStackViewStyle(axis: .vertical, spacing: 2, distribution: .fillEqually)
        stackView.alignment = .center
        return stackView
    }()
    private let infoLabel: BasicComponentLabel = {
        let label = BasicComponentLabel(labelStyle: .system12SB)
        label.setStyle(title: "사이즈", color: .lightGray, alignment: .center)
        return label
    }()
    private let sizeLabel: BasicComponentLabel = {
        let label = BasicComponentLabel(labelStyle: .arial20)
        label.setStyle(title: "188", color: .gray, alignment: .center)
        return label
    }()
    private let megaBytesLabel: UILabel = {
        let label = UILabel()
        label.setStyle("MB", textColor: .gray, font: UIFont.systemFont(ofSize: 12), textAlignment: .center)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.height(70)
        self.width(100)
        sizeVStackView.addArrangedSubviews([infoLabel, sizeLabel, megaBytesLabel])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(with data: AppStoreModel.ResultsEntry) {
        let intSize = round((data.fileSizeBytes.toDouble) / 1000000)
        sizeLabel.text = "\(intSize)"
    }
    
    override func configureAutolayouts() {
        self.addSubview(sizeVStackView)
        
        sizeVStackView.edges(self)
    }
}
