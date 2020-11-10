//  String+Extension.swift
//  myAppStore
//  Created by 송은비 on 2020/10/20.
//  Copyright © 2020 EB. All rights reserved.
import Foundation

extension String {
    func stringToDate(format: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self) ?? Date()
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
}
