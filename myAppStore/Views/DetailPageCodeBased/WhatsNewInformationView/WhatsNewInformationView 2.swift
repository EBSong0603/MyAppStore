//
//  WhatsNewInformationView.swift
//  myAppStore
//
//  Created by 송은비 on 2020/11/12.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class WhatsNewInformationView: ModuleView {

    private let whatsNewInfoVStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.setStackViewStyle(axis: .vertical, spacing: 2, distribution: .fillEqually)
        return stackView
    }()
    
    private let whatsNewView: WhatsNewTitleView =  WhatsNewTitleView()
    private let versionHistoryView: VersionHistoryView = VersionHistoryView()
    private let descriptionview: WhatsNewDescriptionView = WhatsNewDescriptionView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        whatsNewInfoVStackView.addArrangedSubviews([whatsNewView, versionHistoryView, descriptionview])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(with data: AppStoreModel.ResultsEntry) {
        
        versionHistoryView.setData(with: data)
        descriptionview.setData(with: data)
    }
    
    override func configureAutolayouts() {
        self.addSubview(whatsNewInfoVStackView)
        whatsNewInfoVStackView.top(self.topAnchor)
        whatsNewInfoVStackView.leading(self.leadingAnchor)
        whatsNewInfoVStackView.trailing(self.trailingAnchor)
        whatsNewInfoVStackView.bottom(self.bottomAnchor, constant: -15)
    }
}
