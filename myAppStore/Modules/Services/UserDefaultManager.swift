//  SearchResultManager.swift
//  myAppStore
//  Created by 송은비 on 2020/11/25.
//  Copyright © 2020 EB. All rights reserved.

import Foundation

class UserDefaultManager {
    
    static let shared = UserDefaultManager()
    
    var searchResult: [String]? {
        get {
            return UserDefaults.standard.stringArray(forKey: "searchResult")
        }
        set {
            UserDefaults.standard.setWithSync(value: newValue, forKey: "searchResult")
            print("🙌🙌 userDefault Save!")
        }
    }
}
