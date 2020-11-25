//
//  VerticalSeperateView.swift
//  myAppStore
//
//  Created by 송은비 on 2020/11/12.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit

class VerticalSeperatorView: ModuleView {
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        UIColor.lightGray.set()
        path.move(to: CGPoint(x: 0, y: 16))
        path.addLine(to: CGPoint(x: 0, y: 50))
        path.lineWidth = 0.3
        path.close()
        path.stroke()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.width(1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
