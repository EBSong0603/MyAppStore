//  Binding Data.swift
//  myAppStore
//  Created by 송은비 on 2020/10/26.
//  Copyright © 2020 EB. All rights reserved.

import Foundation

func bindData(data: Data, model: AppStoreModel) {
    var json: AppStoreModel?
    
    do {
        json = try JSONDecoder().decode(AppStoreModel.self, from: data)
    } catch {
        print("error: \(error)")
    }
    
    guard let result  = json else {return}

}
