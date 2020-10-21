//
//  BasicButton.swift
//  myAppStore
//
//  Created by 송은비 on 2020/10/20.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit

enum BasicButtonStyle {
    case outlined
    case filled
}

class BasicButton: UIButton {
    

    
    let style: BasicButtonStyle
    
    init(_ style: BasicButtonStyle) {
        //self.style = style 이건 이니셜라이즈 하기 전에 미리 코드 써줘야함
        self.style = style
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //didSet= isHightlighted 의 상태가 바뀔때를 포착해서 그에 맞는 함수를 요청해서 상태의 변화를 이끌어낸다
    override var isHighlighted: Bool {
        didSet {
            setBackground(isHighlighted)
        }
    }
    
    func setBackground(_ isH: Bool) {
        var backgroundColor: UIColor = .clear
        switch self.style {
        case .outlined:
            
            //backgroundColor는 isHighlighted 일땐? lightGray, 아니라면 white 라는 뜻임(아래코드)
            backgroundColor = isHighlighted ? .lightGray : .white
        case .filled:
            backgroundColor = isHighlighted ? .darkGray : .systemBlue
        }
        self.backgroundColor = backgroundColor
    }
    
    func set(_ style: BasicButtonStyle, title: String? = "") {
        var backgroundColor: UIColor = .clear
        var linedColor: UIColor = .clear
        var lineWidth: CGFloat = 0
        switch style {
        case .outlined:
            backgroundColor = .white
            linedColor = .darkGray
            lineWidth = 1
        case .filled:
            backgroundColor = .systemBlue
            linedColor = .clear
            lineWidth = 0
        }
        
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 14)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = 14.5
        self.layer.borderColor = linedColor.cgColor
        self.layer.borderWidth = lineWidth
        //layer.borerWidth = 버튼의 아웃라인의 두께 설정하는 프로퍼티
    }
}




