//
//  UserDefault+Extension.swift
//  myAppStore
//
//  Created by 송은비 on 2020/11/25.
//  Copyright © 2020 EB. All rights reserved.
//

import Foundation

extension UserDefaults {
    
//    #if DEBUG
//    static let suitName: String = "debug"
//    #else
//    static let suitName: String = "release"
//    #endif
    
    static let debugStatus: UserDefaults = UserDefaults(suiteName: "debug")!
    static let releaseStatus: UserDefaults = UserDefaults(suiteName: "release")!
    
    func setWithSyncGeneric<Value>(_ value: Value?, forKey: String) {
        set(value, forKey: forKey)
    }
    
    func setWithSync(value: Any?, forKey: String) {
        set(value, forKey: forKey)
        synchronize()
    }
    
    //bool값은 default 값인 false를 무조건 가지고 있기 때문에 이렇게 따로 만들어줌 (옵셔널이 애초에 아닐수밖에 없어서, 일부러 옵셔널로 만들어주는 작업)
    func maybeBool(forKey: String) -> Bool? {
        return UserDefaults.standard.object(forKey: forKey) as? Bool
    }
    
    //Int 값은 default 값을 가지고 있기 떄문에 이렇게 따로 만들어줌 (옵셔널이 애초에 아닐수밖에 없어서, 일부러 옵셔널로 만들어주는 작업)
    func maybeInt(forKey: String) -> Int? {
        return UserDefaults.standard.object(forKey: forKey) as? Int
    }
}
