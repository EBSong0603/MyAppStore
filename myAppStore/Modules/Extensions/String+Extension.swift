//  String+Extension.swift
//  myAppStore
//  Created by 송은비 on 2020/10/20.
//  Copyright © 2020 EB. All rights reserved.
import Foundation
public enum LanguageType {
    case KO
    case EN
    case JA
    case CN
    case AR
    case RU
    var rawValue: (LangCode: String, Language: String) {
        switch self {
        case .KO: return (LangCode: "KO", Language: "Korean")
        case .EN: return (LangCode: "EN", Language: "English")
        case .JA: return (LangCode: "JA", Language: "Japanese")
        case .CN: return (LangCode: "CN", Language: "Chinese")
        case .AR: return (LangCode: "AR", Language: "Arabic")
        case .RU: return (LangCode: "RU", Language: "Russian")
        }
    }
}
extension String {
    func stringToDate(stringDate: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssz"
        let date = dateFormatter.date(from: stringDate)
        return date ?? Date()
    }

    //String 을 Int로 바꾸는 것
    //보통 func 을 많이 쓰지만 때때로 필요할땐 var를 쓰는 방식도 쓴다(Extension에서 )
    var toInt: Int {
        return Int(self) ?? 0
    }
    
    var toFloat: Float {
        return Float(self) ?? 0
    }
    
    var toDouble: Double {
        return Double(self) ?? 0
    }
    
   func filteredStringArray(with data: [String], count: Int) -> [String] {
        let array: [String] = data
        var each: [String] = []
        array.forEach { piece in
            if each.count > count {return}
            each.append(piece)
        }
        return each
    }
}

extension Array where Element == String {
    func makeFilteredStringArray(with data: [String], count: Int) -> [String] {
         let array: [String] = data
         var each: [String] = []
         array.forEach { piece in
             if each.count > count {return}
             each.append(piece)
         }
         return each
     }
    
    func languageChange(with data: [String]) -> [String] {
        var finalLangsArray: [String] = []
        data.forEach { piece in
            switch piece {
            case LanguageType.KO.rawValue.LangCode:
                finalLangsArray.append(LanguageType.KO.rawValue.Language)
            case LanguageType.EN.rawValue.LangCode:
                finalLangsArray.append(LanguageType.EN.rawValue.Language)
            case LanguageType.JA.rawValue.LangCode:
                finalLangsArray.append(LanguageType.JA.rawValue.Language)
            case LanguageType.CN.rawValue.LangCode:
                finalLangsArray.append(LanguageType.CN.rawValue.Language)
            case LanguageType.AR.rawValue.LangCode:
                finalLangsArray.append(LanguageType.AR.rawValue.Language)
            case LanguageType.RU.rawValue.LangCode:
                finalLangsArray.append(LanguageType.RU.rawValue.Language)
            default:
                break
            }
            
        }
        return finalLangsArray
    }
}
