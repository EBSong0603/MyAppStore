//
//  Int+Extension.swift
//  myAppStore
//
//  Created by 송은비 on 2020/10/21.
//  Copyright © 2020 EB. All rights reserved.
//

import Foundation

extension Double {

    var toInt: Int {
        return Int(self) 
    }
    
    func reduceScale(to places: Int) -> Double {
        let multiplier = pow(10, Double(places))
        let newDecimal = multiplier * self
        let truncated = Double(Int(newDecimal))
        let originalDecimal = truncated
        return originalDecimal
    }
}


