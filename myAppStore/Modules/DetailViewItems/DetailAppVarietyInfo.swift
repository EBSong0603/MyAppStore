//  DetailAppVarietyInfo.swift
//  myAppStore
//  Created by 송은비 on 2020/11/25.
//  Copyright © 2020 EB. All rights reserved.

import Foundation

struct InfoItems {
    var topLabelText: String
    var middelLabelText: String?
    var bottomLabelText: String?
    var onImage: Bool
    var onRatingStarView: Bool
}

class DetailAppVarietyInfoItems {
    
    var items: [InfoItems] = []
    
    init() {
    }
    
    func setData(with data: AppStoreModel.ResultsEntry) {
        
        let UserRC: String = data.userRatingCount.formatPoints(from: data.userRatingCount)
        
        let ageRate: String = data.contentAdvisoryRating
        
        let categoryName: String = data.primaryGenreName
        
        let languages: String = data.languageCodesISO2A.first ?? ""
        let langsCount: Int = data.languageCodesISO2A.count
        
        items = [InfoItems(topLabelText: "\(UserRC) 개의 평가", middelLabelText: "\(data.averageUserRating)", bottomLabelText: nil, onImage: false, onRatingStarView: true),
                 InfoItems(topLabelText: "연령", middelLabelText: "\(ageRate)", bottomLabelText: "세", onImage: false, onRatingStarView: false),
                 InfoItems(topLabelText: "차트", middelLabelText: "#4", bottomLabelText: "\(categoryName)", onImage: false, onRatingStarView: false),
                 InfoItems(topLabelText: "개발자", middelLabelText: nil, bottomLabelText: "아무개", onImage: true, onRatingStarView: false),
                 InfoItems(topLabelText: "언어", middelLabelText: "\(languages)", bottomLabelText: " +\(langsCount - 1)개 언어", onImage: false, onRatingStarView: false)
        ]
    }
}
