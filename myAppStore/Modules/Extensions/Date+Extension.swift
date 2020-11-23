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
    
    func makeTimeGap(today: Date, date: Date ) -> (yG: Int, mG: Int, dG: Int, hG: Int) {

        var result : (yG: Int, mG: Int, dG: Int, hG: Int) = (0, 0, 0, 0)
        let calendar = Calendar.current
        let dateGap = calendar.dateComponents([.year, .month, .day, .hour], from: date, to: today)
        if case let (y?, m?, d?, h?) = (dateGap.year, dateGap.month, dateGap.day, dateGap.hour) {
    
            result.yG = y
            result.mG = m
            result.dG = d
            result.hG = h
        }
        return result
    }
}

