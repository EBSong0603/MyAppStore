//
//  WhatsNewInformationView.swift
//  myAppStore
//
//  Created by 송은비 on 2020/11/12.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class WhatsNewInformationView: ModuleView {
    
    private let whatsNewLabel: UILabel = {
       let label = UILabel()
        label.setStyle("새로운 기능", textColor: .black, font: UIFont.systemFont(ofSize: 20, weight: .bold))
        return label
    }()
    
    private let versionLabel: UILabel = {
       let label = UILabel()
        label.setStyle("버전 기록", textColor: .systemBlue, font: UIFont.systemFont(ofSize: 15))
        return label
    }()
    
    private let versionHistoryView: VersionHistoryView = VersionHistoryView()
    
    let whatsNewDescriptionLabel: UILabel = {
      let label = UILabel()
       label.setStyle("기능이 향상됐어욤!", textColor: .black, font: UIFont.systemFont(ofSize: 12))
       label.numberOfLines = 3
       return label
   }()
    
    private let backView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.alpha = 0.4
        return view
    }()
    
    let openButton: UIButton = UIButton(type: .custom)
    
    let moreInfoLabel: UILabel = {
      let label = UILabel()
       label.setStyle("더보기", textColor: .systemBlue, font: .systemFont(ofSize: 12))
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
//        self.addSubview(backView)
        
        openButton.top(versionHistoryView.bottomAnchor, constant: 8)
        openButton.leading(self.leadingAnchor)
        openButton.trailing(self.trailingAnchor)
        openButton.bottom(self.bottomAnchor)
        openButton.addSubViews([whatsNewDescriptionLabel, moreInfoLabel])
        whatsNewDescriptionLabel.edges(openButton, vConstant: 0, hConstant: 16)
        moreInfoLabel.trailing(openButton.trailingAnchor, constant: -16)
     
        moreInfoLabel.bottom(openButton.bottomAnchor)
//        backView.edges(moreInfoLabel, vConstant: 8, hConstant: 8)
        
    }
}
