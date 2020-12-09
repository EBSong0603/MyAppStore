//  UIViewController+Extensions.swift
//  myAppStore
//  Created by 송은비 on 2020/10/20.
//  Copyright © 2020 EB. All rights reserved.

import UIKit

extension UIViewController {
    
    func presentVC(vc: UIViewController, completion: (() -> Void)?) {
        self.present(vc,
                     animated: true,
                     completion: completion)
    }
    
    func setNaviCustomColor(_ color: UIColor,
                            shadowAlpha: CGFloat = 0.5) {
        
    }
    
    typealias AlertActionHandler = ((UIAlertAction) -> Void)
    
    func showAlert(title: String, message: String, alertControllerStyle: UIAlertController.Style, alertActionStyle: UIAlertAction.Style, okTitle: String = "OK", okHandler: AlertActionHandler? = nil, cancelTitle: String = "Cancel", cancelHandler: AlertActionHandler? = nil, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: alertControllerStyle)
        
        if let okHandler = okHandler {
            let okAction = UIAlertAction(title: okTitle, style: alertActionStyle, handler: okHandler)
            alert.addAction(okAction)
            let cancelAction = UIAlertAction(title: cancelTitle, style: UIAlertAction.Style.cancel, handler: cancelHandler)
            alert.addAction(cancelAction)
            
        } else {
            if let cancelHandler = cancelHandler {
                let cancelAction = UIAlertAction(title: cancelTitle, style: UIAlertAction.Style.cancel, handler: cancelHandler)
                alert.addAction(cancelAction)
            } else {
                let cancelAction = UIAlertAction(title: cancelTitle, style: UIAlertAction.Style.cancel, handler: cancelHandler)
                alert.addAction(cancelAction)
            }
        }
        self.present(alert, animated: true, completion: completion)
    }
}
