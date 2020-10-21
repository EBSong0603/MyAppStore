//
//  UIApplication+Extension.swift
//  myAppStore
//
//  Created by 송은비 on 2020/10/20.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit

extension UIApplication {
    var keyWindow: UIViewController {
        return (self.windows.filter { $0.isKeyWindow }.first?.rootViewController)!
    }
}
