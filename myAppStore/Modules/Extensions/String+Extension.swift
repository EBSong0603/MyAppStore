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
    case FR
    case HR
    case IT
    case TR
    case UK
    case FI
    var rawValue: (LangCode: String, Language: String) {
        switch self {
        case .KO: return (LangCode: "KO", Language: "한국어")
        case .EN: return (LangCode: "EN", Language: "영어")
        case .JA: return (LangCode: "JA", Language: "일본어")
        case .CN: return (LangCode: "CN", Language: "중국어")
        case .AR: return (LangCode: "AR", Language: "아랍어")
        case .RU: return (LangCode: "RU", Language: "러시아어")
        case .FR: return (LangCode: "FR", Language: "프랑스어")
        case .HR: return (LangCode: "RU", Language: "크로아티아어")
        case .IT: return (LangCode: "IT", Language: "이탈리아어")
        case .TR: return (LangCode: "TR", Language: "터키어")
        case .UK: return (LangCode: "UK", Language: "우크라이나어")
        case .FI: return (LangCode: "FI", Language: "핀란드어")
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
    
    var toInt: Int {
        return Int(self) ?? 0
    }
    
    var toFloat: Float {
        return Float(self) ?? 0
    }
    
    var toDouble: Double {
        return Double(self) ?? 0
    }
    
    func fileSizeTrans() -> String {
        let intSize = round((self.toDouble) / 1000000)
        return "\(intSize)"
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
    func makeFilteredStringArray(count: Int) -> [String] {
        //         let array: [String] = data //self () //매개변수 필요없음 익스텐션이라서요
        var each: [String] = []
        //self, 여기에서 self.forEach 해줘야함
        self.forEach { piece in
            if each.count > count {return}
            each.append(piece)
        }
        return each
    }
    
    func availableDevices(with data: AppStoreModel.ResultsEntry) -> [String] {
        let minimumOS = data.minimumOsVersion
        let devices: String = self.joined(separator: ",")
        var supportedDevices: [String] = []
        switch devices {
        case let str where str.contains("iPhone"):
            supportedDevices.append("iPhone \niOS \(minimumOS)이상 필요")
        case let str where str.contains("iPad"):
            supportedDevices.append("iPad \niOS \(minimumOS)이상 필요")
        case let str where str.contains("iPodTouch"):
            supportedDevices.append("IPod Touch \niOS \(minimumOS)이상 필요")
        default:
            break
        }
        return supportedDevices
    }
    
    func languageChange() -> [String] {
        var finalLangsArray: [String] = []
        self.forEach { piece in
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
            case LanguageType.FR.rawValue.LangCode:
                finalLangsArray.append(LanguageType.FR.rawValue.Language)
            case LanguageType.HR.rawValue.LangCode:
                finalLangsArray.append(LanguageType.HR.rawValue.Language)
            case LanguageType.IT.rawValue.LangCode:
                finalLangsArray.append(LanguageType.IT.rawValue.Language)
            case LanguageType.TR.rawValue.LangCode:
                finalLangsArray.append(LanguageType.TR.rawValue.Language)
            case LanguageType.UK.rawValue.LangCode:
                finalLangsArray.append(LanguageType.UK.rawValue.Language)
            case LanguageType.FI.rawValue.LangCode:
                finalLangsArray.append(LanguageType.FI.rawValue.Language)
            default:
                break
            }
        }
        return finalLangsArray
    }
}
