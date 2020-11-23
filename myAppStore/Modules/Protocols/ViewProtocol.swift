//  ViewProtocol.swift
//  myAppStore
//  Created by 송은비 on 2020/10/20.
//  Copyright © 2020 EB. All rights reserved.

import Foundation

protocol Viewable {
    func configureAutolayouts()
}

protocol Cellable: Viewable {
    static var identifier: String { get }
}
