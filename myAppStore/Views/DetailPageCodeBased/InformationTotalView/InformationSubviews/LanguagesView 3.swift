//
//  LanguagesView.swift
//  myAppStore
//
//  Created by 송은비 on 2020/11/12.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class LanguagesView: ModuleView {
//
//    public enum LanguageType {
//        case KO
//        case EN
//        case JA
//        case CN
//        var rawValue: (LangCode: String, Language: String) {
//            switch self {
//            case .KO: return (LangCode: "KO", Language: "Korean")
//            case .EN: return (LangCode: "EN", Language: "English")
//            case .JA: return (LangCode: "JA", Language: "Japanese")
//            case .CN: return (LangCode: "CN", Language: "Chinese")
//            }
//        }
//    }
    
    private let langLabel: UILabel = {
        let label = UILabel()
        label.setStyle("Languages", textColor: .gray, font: UIFont.systemFont(ofSize: 12))
        return label
    }()
    
    private let langInfoLabel: UILabel = {
        let label = UILabel()
        label.setStyle("Korean and English", textColor: .black, font: UIFont.systemFont(ofSize: 12))
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
 
        
//        var practiceLang: [String] = []
        let langsCount: Int = data.languageCodesISO2A.count
        
        
        let willFiltered: [String] = data.languageCodesISO2A.makeFilteredStringArray(with: data.languageCodesISO2A, count: 1)
  
//        let langs: [String] = filteredLanguages(with: data)

        var finalLanguageArray : [String] = []
            
        finalLanguageArray = willFiltered.languageChange(with: willFiltered)
        
//        willFiltered.forEach { lang in
//            switch lang {
//            case LanguageType.KO.rawValue.LangCode:
//                practiceLang.append(LanguageType.KO.rawValue.Language)
//            case LanguageType.EN.rawValue.LangCode:
//                practiceLang.append(LanguageType.EN.rawValue.Language)
//            case LanguageType.JA.rawValue.LangCode:
//                practiceLang.append(LanguageType.JA.rawValue.Language)
//            case LanguageType.CN.rawValue.LangCode:
//                practiceLang.append(LanguageType.CN.rawValue.Language)
//            default:
//                break
//            }
//        }
        
        
        langInfoLabel.text = (langsCount > 2) ? "\(finalLanguageArray.first ?? "") and \(langsCount - 1) more" : "\(finalLanguageArray.joined(separator: " and "))"
    }
    
    //일단 사용은 안하지만 혹시나 모를것에 대비 살려놓음
//    private func filteredLanguages(with data: AppStoreModel.ResultsEntry) -> [String] {
//
//        let langArray: [String] = data.languageCodesISO2A
//        var langs: [String] = []
//        langArray.forEach { lang in
//            if langs.count > 1 {return}
//            langs.append(lang)
//        }
//        return langs
//    }

    override func configureAutolayouts() {
        
        self.addSubViews([langLabel, langInfoLabel])
        langLabel.top(self.topAnchor)
        langLabel.leading(self.leadingAnchor, constant: 16)
        langLabel.bottom(self.bottomAnchor)
        
        langInfoLabel.centerY(langLabel.centerYAnchor)
        langInfoLabel.trailing(self.trailingAnchor, constant: -16)
    }
}



