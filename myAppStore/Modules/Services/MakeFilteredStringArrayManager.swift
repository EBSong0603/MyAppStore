//  MakeFilteredStringArrayManager.swift
//  myAppStore
//  Created by 송은비 on 2020/11/16.
//  Copyright © 2020 EB. All rights reserved.

import UIKit

class MakeFilteredStringArrayManager {
    
    static func makeFilteredArray<T>(with data: [T], count: Int) -> [T] {
        let array: [T] = data
        var each: [T] = []
        array.forEach { piece in
            if each.count > count {return}
            each.append(piece)
        }
        return each
    }
}
