//  UserDefault+Extension.swift
//  myAppStore
//  Created by 송은비 on 2020/11/25.
//  Copyright © 2020 EB. All rights reserved.

import Foundation

extension UserDefaults {
    
    static let debugStatus: UserDefaults = UserDefaults(suiteName: "debug")!
    static let releaseStatus: UserDefaults = UserDefaults(suiteName: "release")!
    
    func setWithSyncGeneric<Value>(_ value: Value?, forKey: String) {
        set(value, forKey: forKey)
    }
    
    func setWithSync(value: Any?, forKey: String) {
        set(value, forKey: forKey)
        synchronize()
    }
    
    func maybeBool(forKey: String) -> Bool? {
        return UserDefaults.standard.object(forKey: forKey) as? Bool
    }
    
    func maybeInt(forKey: String) -> Int? {
        return UserDefaults.standard.object(forKey: forKey) as? Int
    }
}
