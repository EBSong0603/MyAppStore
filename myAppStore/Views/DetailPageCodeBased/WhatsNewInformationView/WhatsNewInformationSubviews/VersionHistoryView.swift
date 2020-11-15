//
//  VersionHistoryView.swift
//  myAppStore
//
//  Created by 송은비 on 2020/11/12.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class VersionHistoryView: ModuleView {
    
    private let versionHistoryLabel: UILabel = {
       let label = UILabel()
        label.setStyle("version 1.42", textColor: .gray, font: UIFont.systemFont(ofSize: 12))
        return label
    }()
    
    private let updatePeriodLabel: UILabel = {
       let label = UILabel()
        label.setStyle("1mo age", textColor: .gray, font: UIFont.systemFont(ofSize: 12))
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
            updatePeriodLabel.text = "\(timeGap.dG)d ago"
        case 7..<14:
            updatePeriodLabel.text = "1w ago"
        case 14..<21:
            updatePeriodLabel.text = "2w ago"
        case 21..<28:
            updatePeriodLabel.text = "3w ago"
        case 28..<35:
            updatePeriodLabel.text = "4w ago"
        case 35..<365:
            updatePeriodLabel.text = "\(timeGap.mG)m ago"
        case 365...Int.max:
            updatePeriodLabel.text = "\(timeGap.yG)y ago"
        default:
            break
        }
    }
    
    override func configureAutolayouts() {
        
        self.addSubViews([versionHistoryLabel, updatePeriodLabel])
        
        versionHistoryLabel.leading(self.leadingAnchor, constant: 16)
        versionHistoryLabel.top(self.topAnchor)
        versionHistoryLabel.bottom(self.bottomAnchor)
        
        updatePeriodLabel.centerY(self.centerYAnchor)
        updatePeriodLabel.trailing(self.trailingAnchor, constant: -16)
    }
}
