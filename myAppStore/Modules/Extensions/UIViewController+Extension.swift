//
//  UIViewController+Extensions.swift
//  myAppStore
//
//  Created by 송은비 on 2020/10/20.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit


//completion이 매개변수로 있는 extension의 func
//extension을 사용할때 completion을 사용하는 방법
//completion: (() -> Void)?) 를 매개변수의 Type으로 사용한다
  
//ViewController를 상속해서 쓸때는 아래와 같이 내가 만든 나만의 기능들을 만들어서 이렇게 쓸수 있음
extension UIViewController {
    
    
    func presentVC(vc: UIViewController, completion: (() -> Void)?) {
        self.present(vc, animated: true, completion: completion)
    }
    

    func setNaviCustomColor(_ color: UIColor, shadowAlpha: CGFloat = 0.5) {

    }
}
