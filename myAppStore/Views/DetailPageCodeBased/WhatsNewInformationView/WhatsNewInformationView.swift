//  WhatsNewInformationView.swift
//  myAppStore
//  Created by 송은비 on 2020/11/12.
//  Copyright © 2020 EB. All rights reserved.

import UIKit

class WhatsNewInformationView: ModuleView {
    
    private let whatsNewLabel: BasicComponentLabel = {
        let label = BasicComponentLabel(labelStyle: .system20B)
        label.setStyle(title: "새로운기능", color: .black)
        return label
    }()
    
    private let versionLabel: BasicComponentLabel = {
        let label = BasicComponentLabel(labelStyle: .system15)
        label.setStyle(title: "버전기록", color: .systemBlue)
        return label
    }()
    
    private let versionHistoryView: VersionHistoryView = VersionHistoryView()
    
    let whatsNewDescriptionLabel: BasicComponentLabel = {
        let label = BasicComponentLabel(labelStyle: .system12)
        label.setStyle(title: "기능이 향상되었어요!", color: .black)
        label.numberOfLines = 3
        return label
    }()
    
    private let backView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.alpha = 0.9
        return view
    }()
    
    let openButton: UIButton = UIButton(type: .custom)
    
    let moreInfoLabel: BasicComponentLabel = {
        let label = BasicComponentLabel(labelStyle: .system12)
        label.setStyle(title: "더보기", color: .systemBlue)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        openButton.addTarget(self, action: #selector(openButtonClicked), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(with data: AppStoreModel.ResultsEntry) {
        
        versionHistoryView.setData(with: data)
        whatsNewDescriptionLabel.text = data.releaseNotes
    }
    
    @objc private func openButtonClicked() {
        whatsNewDescriptionLabel.numberOfLines = 0
        UIView.transition(with: self.moreInfoLabel, duration: 0.2, options: .transitionCrossDissolve, animations: {
            self.moreInfoLabel.alpha = 0
            self.backView.alpha = 0
        })
    }
    
    override func configureAutolayouts() {
        
        self.addSubViews([whatsNewLabel, versionLabel])
        whatsNewLabel.top(self.topAnchor)
        whatsNewLabel.leading(self.leadingAnchor, constant: 16)
        versionLabel.trailing(self.trailingAnchor, constant: -16)
        versionLabel.centerY(whatsNewLabel.centerYAnchor)
        
        self.addSubview(versionHistoryView)
        versionHistoryView.top(whatsNewLabel.bottomAnchor, constant: 8)
        versionHistoryView.leading(self.leadingAnchor)
        versionHistoryView.trailing(self.trailingAnchor)
        
        self.addSubview(openButton)
        openButton.top(versionHistoryView.bottomAnchor, constant: 8)
        openButton.leading(self.leadingAnchor)
        openButton.trailing(self.trailingAnchor)
        openButton.bottom(self.bottomAnchor)
        openButton.addSubViews([whatsNewDescriptionLabel, backView, moreInfoLabel])
        whatsNewDescriptionLabel.edges(openButton, vConstant: 0, hConstant: 16)
        
        moreInfoLabel.trailing(openButton.trailingAnchor, constant: -16)
        moreInfoLabel.bottom(openButton.bottomAnchor, constant: 0)
        
        backView.top(moreInfoLabel.topAnchor, constant: -8)
        backView.leading(moreInfoLabel.leadingAnchor, constant: -8)
        backView.trailing(moreInfoLabel.trailingAnchor, constant: 8)
        backView.bottom(moreInfoLabel.bottomAnchor, constant: 8)
    }
}
