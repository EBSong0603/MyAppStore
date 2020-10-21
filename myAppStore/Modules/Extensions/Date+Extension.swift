//
//  Date+Extension.swift
//  myAppStore
//
//  Created by 송은비 on 2020/10/20.
//  Copyright © 2020 EB. All rights reserved.
//

import Foundation


//Date를 String으로 만들어주는 내가 만든 기능(함수)
extension Date {
    func dateToString(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}

