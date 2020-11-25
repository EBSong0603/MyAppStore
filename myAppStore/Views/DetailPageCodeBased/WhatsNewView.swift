//  WhatsNewInformationView.swift
//  myAppStore
//  Created by 송은비 on 2020/11/12.
//  Copyright © 2020 EB. All rights reserved.

import UIKit

class WhatsNewView: ModuleView {

    private let versionHistoryLabel: BasicComponentLabel = {
        let label = BasicComponentLabel(labelStyle: .system12)
        label.setStyle(title: "버전 14.2", color: .gray)
        return label
    }()
    
    private let updatePeriodLabel: BasicComponentLabel = {
        let label = BasicComponentLabel(labelStyle: .system12)
        label.setStyle(title: "1일 전", color: .gray)
        return label
    }()

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
        
        whatsNewDescriptionLabel.text = data.releaseNotes
        
        versionHistoryLabel.text = data.version
        
        let todayDate = Date()
        let realseStringDate = data.currentVersionReleaseDate
        
        let releasDate = realseStringDate.stringToDate(stringDate: realseStringDate)
        
        let interval = todayDate.timeIntervalSince(releasDate)
        let days = Int(interval / 86400)

        let timeGap = releasDate.makeTimeGap(today: todayDate, date: releasDate)

        switch days {
        case 0:
            print("zero")
        case 1..<7:
            updatePeriodLabel.text = "\(timeGap.dG)일 전"
        case 7..<14:
            updatePeriodLabel.text = "1주 전"
        case 14..<21:
            updatePeriodLabel.text = "2주 전"
        case 21..<28:
            updatePeriodLabel.text = "3주 전"
        case 28..<35:
            updatePeriodLabel.text = "4주 전"
        case 35..<365:
            updatePeriodLabel.text = "\(timeGap.mG)달 전"
        case 365...Int.max:
            updatePeriodLabel.text = "\(timeGap.yG)년 전"
        default:
            break
        }
    }
    
    @objc private func openButtonClicked() {
        whatsNewDescriptionLabel.numberOfLines = 0
        UIView.transition(with: self.moreInfoLabel, duration: 0.2, options: .transitionCrossDissolve, animations: {
            self.moreInfoLabel.alpha = 0
            self.backView.alpha = 0
        })
    }
    
    override func configureAutolayouts() {

        self.addSubview(versionHistoryLabel)
        self.addSubview(updatePeriodLabel)
        versionHistoryLabel.top(self.topAnchor, constant: 0)
        versionHistoryLabel.leading(self.leadingAnchor, constant: 16)
        
        updatePeriodLabel.trailing(self.trailingAnchor, constant: -16)
        updatePeriodLabel.centerY(versionHistoryLabel.centerYAnchor)

        self.addSubview(openButton)
        openButton.top(versionHistoryLabel.bottomAnchor, constant: 8)
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
