//  BaseViewController.swift
//  myAppStore
//  Created by 송은비 on 2020/10/20.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class BaseViewController: UIViewController, Viewable {
    
    var safeArea: UILayoutGuide {
        return view.safeAreaLayoutGuide
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAutolayouts()
    }
    
    func configureAutolayouts() {
        
    }
}
