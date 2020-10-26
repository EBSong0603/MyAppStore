//  UIStackView+Extension.swift
//  myAppStore
//  Created by 송은비 on 2020/10/20.
//  Copyright © 2020 EB. All rights reserved.

import UIKit

//extension = 내가 직접 만드는 func 이라고 생각하면 됨
//많이 쓰는 귀찮고 긴 코드들을 하나로 공통으로 빼서 다른곳에서 그 Type을 쓸때 가져다가 씀!

//앞에 꼭 self를 써줘야 하는것은, 현재는 기능만 만들뿐 대상은 없기때문에! 나 자신에게 (self)기능 첨가해줘야 하는것

extension UIStackView { //여기서 self는 UIStackView를 가르킴
    func addArrangedSubviews(_ views: [UIView]) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
    
    func setStackViewStyle(axis: NSLayoutConstraint.Axis,
                           spacing: CGFloat = 0,
                           distribution: UIStackView.Distribution) {
        self.axis = axis
        self.spacing = spacing
        self.distribution = distribution
    }
    
    func removeSubviews(_ views: [UIView]) {
        for view in views {
            self.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
    }
}
