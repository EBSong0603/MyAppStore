//  InformationView.swift
//  myAppStore
//  Created by 송은비 on 2020/11/12.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

struct InformationItem {
    var title: String
    var value: String?
    var description: String?
    var isArrow: Bool
    var icon: UIImage?
}

class InformationTotalView: ModuleView {
    
    private let infoTotalVStackView: UIStackView = {
      let stackView = UIStackView()
        stackView.setStackViewStyle(axis: .vertical, spacing: 10, distribution: .fill)
        return stackView
    }()
    
    private let informationtitleLabel: BasicComponentLabel = {
        let label = BasicComponentLabel(labelStyle: .system20B)
        label.setStyle(title: "정보", color: .black)
        return label
    }()
    
    var infoItems: [InformationItem] = []

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(with data: AppStoreModel.ResultsEntry) {
        
        let fileSize = data.fileSizeBytes.fileSizeTrans()
        
        let devices = data.supportedDevices.availableDevices(with: data)

        let langsCount: Int = data.languageCodesISO2A.count
        let languages = data.languageCodesISO2A.languageChange()
        let filteredLangs: [String] = languages.makeFilteredStringArray(count: 1)
        let langsResult: String = (langsCount > 2) ? ((filteredLangs.first ?? "")+"외 "+"\(langsCount - 1)개") : (filteredLangs.joined(separator: "와 "))
        
        infoItems = [
            InformationItem(title: "제공자", value: data.artistName, description: nil, isArrow: false, icon: nil),
            InformationItem(title: "크기", value: fileSize+"MB", description: nil, isArrow: false, icon: nil),
            InformationItem(title: "카테고리", value: data.primaryGenreName, description: nil, isArrow: false, icon: nil),
            InformationItem(title: "호환성", value: "이 iPhone과 호환", description: devices.joined(), isArrow: true, icon: nil),
            InformationItem(title: "언어", value: langsResult, description: "\(languages.joined(separator: ","))", isArrow: true, icon: nil),
            InformationItem(title: "연령등급", value: data.trackContentRating, description: data.trackContentRating + "\n" + data.advisories.joined(), isArrow: true, icon: nil),
            InformationItem(title: "앱내구입", value: "사용가능", description: "", isArrow: true, icon: nil),
            InformationItem(title: "저작권", value: "© "+data.artistName, description: nil, isArrow: false, icon: nil),
            InformationItem(title: "개발자 웹 사이트", value: "", description: nil, isArrow: false, icon: UIImage(systemName: "safari")!),
            InformationItem(title: "개인정보 처리방침", value: "", description: nil, isArrow: false, icon: UIImage(systemName: "hand.raised.fill")!)
        ]
        
        for item in infoItems {
            let infoView = InformationView(with: item)
            infoTotalVStackView.addArrangedSubview(infoView)
            let seperator = HorizonSeperatorView()
            infoTotalVStackView.addArrangedSubview(seperator)
        }
    }

    override func configureAutolayouts() {
        
        self.addSubview(infoTotalVStackView)
        self.addSubview(informationtitleLabel)
        
        informationtitleLabel.top(self.topAnchor)
        informationtitleLabel.leading(self.leadingAnchor, constant: 16)
        informationtitleLabel.trailing(self.trailingAnchor)
        
        infoTotalVStackView.top(informationtitleLabel.bottomAnchor, constant: 8)
        infoTotalVStackView.leading(self.leadingAnchor)
        infoTotalVStackView.trailing(self.trailingAnchor)
        infoTotalVStackView.bottom(self.bottomAnchor)
    }
}
