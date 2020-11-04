//  RatingStarImageView.swift
//  myAppStore
//  Created by 송은비 on 2020/10/30.
////  Copyright © 2020 EB. All rights reserved.
import UIKit

public enum StarStyle1 {
    case smallEmpty
    case smallFilled
    case middleEmpty
    case middleFilled
    case largeEmpty
    case largeFilled

    var rawVale: (imageName: String, size: CGFloat, tintColor: UIColor) {
        switch self {
        case .smallEmpty: return ("star", 8, .lightGray)
        case.smallFilled: return ("star.fill", 8, .lightGray)
        case .middleEmpty: return ("star", 12, .gray)
        case .middleFilled: return ("star.fill", 12, .gray)
        case .largeEmpty: return ("star", 14,.lightGray)
        case .largeFilled: return ("star.fill", 14, .lightGray)
        }
    }
}


