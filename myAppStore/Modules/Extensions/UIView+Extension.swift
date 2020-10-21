//
//  UIView+Extension.swift
//  myAppStore
//
//  Created by 송은비 on 2020/10/20.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit

//UIView를 상속하고 있는 어떤 클래스에서든 쓸 수 있는 extension들
//Layout 잡기위한 extension 임
extension UIView {
    
    func top(_ equalTo: NSLayoutYAxisAnchor, constant: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.topAnchor.constraint(equalTo: equalTo, constant: constant).isActive = true
    }
    
    func leading(_ equalTo: NSLayoutXAxisAnchor, constant: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.leadingAnchor.constraint(equalTo: equalTo, constant: constant).isActive = true
    }
    
    func trailing(_ equalTo: NSLayoutXAxisAnchor, constant: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.trailingAnchor.constraint(equalTo: equalTo, constant: constant).isActive = true
    }
    
    func bottom(_ equalTo: NSLayoutYAxisAnchor, constant: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.bottomAnchor.constraint(equalTo: equalTo, constant: constant).isActive = true
    }
    
    func width(_ equalTo: NSLayoutDimension, constant: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
       
        self.widthAnchor.constraint(equalToConstant: constant).isActive =  true
    }
    
    //매개변수만 다르게 해주면 같은 변수이름의 func 만들수 있음
    func edges(_ equalTo: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        //UIView에서의 edge consraint 잡아줄 func
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: equalTo.topAnchor),
            self.leadingAnchor.constraint(equalTo: equalTo.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: equalTo.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: equalTo.bottomAnchor)
        ])
    }
    

    func edges(_ equalTo: UIView, vConstant: CGFloat, hConstant: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        //UIView에서의 edge consraint 잡아줄 func
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: equalTo.topAnchor, constant: vConstant),
            self.leadingAnchor.constraint(equalTo: equalTo.leadingAnchor, constant: hConstant),
            self.trailingAnchor.constraint(equalTo: equalTo.trailingAnchor, constant: -hConstant),
            self.bottomAnchor.constraint(equalTo: equalTo.bottomAnchor, constant: -vConstant)
        ])
    }
    
    
    func edges(_ equalTo: UILayoutGuide) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        //UILayoutGuide에서의 edge constraint를 잡아줄 func
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: equalTo.topAnchor),
            self.leadingAnchor.constraint(equalTo: equalTo.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: equalTo.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: equalTo.bottomAnchor)
        ])
    }
    

    
//    private func prepareAutolayout() {
//        self.translatesAutoresizingMaskIntoConstraints = false
//    }
}
