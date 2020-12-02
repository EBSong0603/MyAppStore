//
//  DetailInformation.swift
//  myAppStore
//
//  Created by 송은비 on 2020/11/25.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit

struct InfoItem {
    var title: String
    var value: String?
    var description: String?
    var isArrow: Bool
    var icon: UIImage?
}

class informationItems {
    
    var items:[InfoItem] = []
    init() {
        
    }
    
    func setData(with data: AppStoreModel.ResultsEntry) {
        let fileSize = data.fileSizeBytes.fileSizeTrans()
        
        let devices = data.supportedDevices.availableDevices(with: data)
        
        let langsCount: Int = data.languageCodesISO2A.count
        let languages = data.languageCodesISO2A.languageChange()
        let filteredLangs: [String] = languages.makeFilteredStringArray(count: 1)
        let langsResult: String = (langsCount > 2) ? ((filteredLangs.first ?? "")+"외 "+"\(langsCount - 1)개") : (filteredLangs.joined(separator: "와 "))
        
        items = [
            InfoItem(title: "제공자", value: data.artistName, description: nil, isArrow: false, icon: nil),
            InfoItem(title: "크기", value: fileSize+"MB", description: nil, isArrow: false, icon: nil),
            InfoItem(title: "카테고리", value: data.primaryGenreName, description: nil, isArrow: false, icon: nil),
            InfoItem(title: "호환성", value: "이 iPhone과 호환", description: devices.joined(), isArrow: true, icon: nil),
            InfoItem(title: "언어", value: langsResult, description: "\(languages.joined(separator: ","))", isArrow: true, icon: nil),
            InfoItem(title: "연령등급", value: data.trackContentRating
                            ,description: data.trackContentRating + "\n" + data.advisories.joined()
                            , isArrow: true, icon: nil),
            InfoItem(title: "저작권", value: "© "+data.artistName, description: nil, isArrow: false, icon: nil),
            InfoItem(title: "개발자 웹 사이트", value: "", description: nil, isArrow: false, icon: UIImage(systemName: "safari")!),
            InfoItem(title: "개인정보 처리방침", value: "", description: nil, isArrow: false, icon: UIImage(systemName: "hand.raised.fill")!)
        ]
    }
}

