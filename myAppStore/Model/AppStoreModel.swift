//
//  AppStoreModel.swift
//  myAppStore
//
//  Created by 송은비 on 2020/10/17.
//  Copyright © 2020 EB. All rights reserved.
//

import Foundation

struct AppStoreModel: Codable {
    
    let resultCount: Int
    let results: [ResultsEntry]
    

    
    struct ResultsEntry: Codable {
        let isGameCenterEnabled: Bool //게임센터 여부
        let advisories: [String] //컨텐츠 위험안내: 상습적인/과격한 의료/치료 정보
        let screenshotUrl: [String] //앱 캡쳐 이미지(3-10개)
        let kind: String //Software
        let sellerName: String //만든 회사이름
        let trackName: String //앱이름
        let minimumOsVersion: String //최소 대응 OS
        let releaseDate: String //출시일
        let currentVersionREleaseDate: String //가장 최신 버전 출시일
        let formattedPrice: String //앱가격: 무료
        let primaryGenreName: String //앱 카테고리 이름(영어)
        let languageCodesISO2A : [String] //지원 언어
    
        let releaseNotes: String //출시노트: 버그들이 수정되었어요
        let trackCensoredName: String //앱이름
        let fileSizeBytes: String //앱사이즈
        let sellerUrl: String //판매자 주소
        let averageUserRating: Float //유저 평가점수(1-5)
        let contentAdvisoryRating: String //age: 4+
        let trackContentRating: String //등급: 4+
        let description: String //앱설명(길다)
        let artistName: String //만든 회사 이름
        let genres: [String] //앱의 카테고리(한글)
        let bundleId: String //만든 사람 번들아이디: com.cashwalk.cashwalk
        let userRatingCount: Int //리뷰갯수
        
        
    }
    
    
    
    
    
}
