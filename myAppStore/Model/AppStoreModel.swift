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

    private enum CodingKeys: String, CodingKey {
        case resultCount
        case results
         }
    
    init(from decode: Decoder) throws {
        let values = try decode.container(keyedBy: CodingKeys.self)
        
        resultCount = (try? values.decode(Int.self, forKey: .resultCount)) ?? 0
        results = (try? values.decode([ResultsEntry].self, forKey: .results)) ?? []
    }
    
    struct ResultsEntry: Codable {
        let isGameCenterEnabled: Bool //게임센터 여부
        let advisories: [String] //컨텐츠 위험안내: 상습적인/과격한 의료/치료 정보
        let screenshotUrls: [String] //앱 캡쳐 이미지(3-10개)
        let artworkUrl512: String
        let kind: String //Software
        let sellerName: String //만든 회사이름
        let trackName: String //앱이름
        let minimumOsVersion: String //최소 대응 OS
        let releaseDate: String //출시일
        let currentVersionReleaseDate: String //가장 최신 버전 출시일
        let formattedPrice: String //앱가격: 무료
        let primaryGenreName: String //앱 카테고리 이름(영어)
        let languageCodesISO2A : [String] //지원 언어
//        let releaseNotes: String //출시노트: 버그들이 수정되었어요
        let trackCensoredName: String //앱이름
        let fileSizeBytes: String //앱사이즈
//        let sellerUrl: String //판매자 주소 sellerUrl
        let averageUserRating: Float //유저 평가점수(1-5)
        let contentAdvisoryRating: String //age: 4+
        let trackContentRating: String //등급: 4+
        let description: String //앱설명(길다)
        let artistName: String //만든 회사 이름
        let genres: [String] //앱의 카테고리(한글)
        let genreIds: [String]
        let bundleId: String //만든 사람 번들아이디: com.cashwalk.cashwalk
        let userRatingCount: Int //리뷰갯수
        
        private enum CodingKeys: String, CodingKey {
            case isGameCenterEnabled
            case advisories
            case screenshotUrls
            case artworkUrl512
            case kind
            case sellerName
            case trackName
            case minimumOsVersion
            case releaseDate
            case currentVersionReleaseDate
            case formattedPrice
            case primaryGenreName
            case languageCodesISO2A
            case trackCensoredName
            case fileSizeBytes
            case averageUserRating
            case contentAdvisoryRating
            case trackContentRating
            case description
            case artistName
            case genres
            case genreIds
            case bundleId
            case userRatingCount
        }
        
        init(from decode: Decoder) throws {
            let values = try decode.container(keyedBy: CodingKeys.self)
            
            isGameCenterEnabled = (try? values.decode(Bool.self, forKey: .isGameCenterEnabled)) ?? false
            advisories = (try? values.decode([String].self, forKey: .advisories)) ?? [""]
            screenshotUrls = (try? values.decode([String].self, forKey: .screenshotUrls)) ?? [""]
            artworkUrl512 = (try? values.decode(String.self, forKey: .artworkUrl512)) ?? ""
            print("artwork: \(artworkUrl512)")
            kind = (try? values.decode(String.self, forKey: .kind)) ?? ""
            sellerName = (try? values.decode(String.self, forKey: .kind)) ?? ""
            trackName = (try? values.decode(String.self, forKey: .trackName)) ?? ""
            minimumOsVersion = (try? values.decode(String.self, forKey: .minimumOsVersion)) ?? ""
            releaseDate = (try? values.decode(String.self, forKey: .releaseDate)) ?? ""
            currentVersionReleaseDate = (try? values.decode(String.self, forKey: .currentVersionReleaseDate)) ?? ""
            formattedPrice = (try? values.decode(String.self, forKey: .formattedPrice)) ?? ""
            primaryGenreName = (try? values.decode(String.self, forKey: .primaryGenreName)) ?? ""
            languageCodesISO2A = (try? values.decode([String].self, forKey: .languageCodesISO2A)) ?? [""]
            trackCensoredName = (try? values.decode(String.self, forKey: .trackCensoredName)) ?? ""
            fileSizeBytes = (try? values.decode(String.self, forKey: .fileSizeBytes)) ?? ""
            averageUserRating = round(((try? values.decode(Float.self, forKey: .averageUserRating))) ?? 0)
            print("평점: \(averageUserRating)")
            contentAdvisoryRating = (try? values.decode(String.self, forKey: .contentAdvisoryRating)) ?? ""
            trackContentRating = (try? values.decode(String.self, forKey: .trackContentRating)) ?? ""
            description = (try? values.decode(String.self, forKey: .description)) ?? ""
            artistName = (try? values.decode(String.self, forKey: .artistName)) ?? ""
            genres = (try? values.decode([String].self, forKey: .genres)) ?? [""]
            genreIds = (try? values.decode([String].self, forKey: .genreIds)) ?? [""]
            bundleId = (try? values.decode(String.self, forKey: .bundleId)) ?? ""
            userRatingCount = (try? values.decode(Int.self, forKey: .userRatingCount)) ?? 0
               
        }
     
    }
}

