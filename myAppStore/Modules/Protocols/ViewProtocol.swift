//
//  ViewProtocol.swift
//  myAppStore
//
//  Created by 송은비 on 2020/10/20.
//  Copyright © 2020 EB. All rights reserved.
//

import Foundation

protocol Viewable {
    func configureAutolayouts()
}

protocol Cellable {
    static var identifier: String { get }
}

//{get} = 그냥 값을 넣기만 하는것
//{set} = 값을 넣고 그걸 가지고 또 다른 것을 할수 있음
