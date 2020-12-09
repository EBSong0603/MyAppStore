//  UIStackView+Extension.swift
//  myAppStore
//  Created by 송은비 on 2020/10/20.
//  Copyright © 2020 EB. All rights reserved.

import UIKit

extension UIStackView {
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
    
    func style(axis: NSLayoutConstraint.Axis,
               spacing: CGFloat = 0,
               distribution: UIStackView.Distribution) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.distribution = distribution
        return stackView
    }
    
    func removeAllSubViews() {
        for view in arrangedSubviews {
            removeArrangedSubview(view)
            view.removeFromSuperview()
        }
    }
    
    func removeSubviews(_ views: [UIView]) {
        for view in views {
            self.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
    }
    
    func removeSafelySubviews() {
        let removedSubviews = arrangedSubviews.reduce([]) { (sum, next) -> [UIView] in
            self.removeArrangedSubview(next)
            return sum + [next]
        }
        NSLayoutConstraint.deactivate(removedSubviews.flatMap({ $0.constraints }))
        removedSubviews.forEach({ $0.removeFromSuperview() })
    }
}
