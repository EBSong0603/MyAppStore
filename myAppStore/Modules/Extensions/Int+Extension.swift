//
//  Int+Extension.swift
//  myAppStore
//
//  Created by 송은비 on 2020/10/23.
//  Copyright © 2020 EB. All rights reserved.
//

import Foundation

extension Int {
    
    func formatPoints(from: Int) -> String {
        let number = from
        let thousand = number / 1000
        let million  = number / 1000000
        let billion = number / 1000000000
        
        if billion >= 1 {
            return "\((billion*10)/10)B"
        } else if million >= 1 {
            return "\((million*10)/10)M"
        } else if thousand >= 1 {
            return "\((thousand*10)/10)K"
        } else {
            return "\(Int(number))"
        }
    }
}
