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
    
    //위의 반환값이 없는 함수로 만든 것과 아래와 같이 반환값이 있는 함수로 만들면
    //반환값이 있는 함수로 만드는게 나중에 익스텐션 코드로 활용했을때 훨 짧아짐 (왜냐면 미리 return stackView를 끝내준것이기 때문에!
    //별다른거 안해주는 간단한 작업으로 이니셜라이즈 해주는 경우에는 이 익스텐션 함수를 이용해서 하면 코드 간결해짐
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
