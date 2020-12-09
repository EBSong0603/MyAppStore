//  Date+Extension.swift
//  myAppStore
//  Created by 송은비 on 2020/10/20.
//  Copyright © 2020 EB. All rights reserved.

import Foundation

extension Date {
    func dateToString(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    func makeTimeGap(fromToday: Date, timeGap: Int) -> String? {
        var timeGapString: String?
        let calendar = Calendar.current
        let dateGapComponents = calendar.dateComponents([.year, .month, .day, .hour], from: self, to: fromToday)
        
        if case let (y?, m?, d?, h?) = (dateGapComponents.year, dateGapComponents.month, dateGapComponents.day, dateGapComponents.hour) {
            
            switch timeGap {
            case 0:
                timeGapString = "\(h)시간 전"
            case 1..<7:
                timeGapString = "\(d)일 전"
            case 7..<14:
                timeGapString = "1주 전"
            case 14..<21:
                timeGapString = "2주 전"
            case 21..<28:
                timeGapString = "3주 전"
            case 28..<35:
                timeGapString = "4주 전"
            case 35..<365:
                timeGapString = "\(m)달 전"
            case 365...Int.max:
                timeGapString = "\(y)년 전"
            default:
                break
            }
        }
        return timeGapString
    }
}

