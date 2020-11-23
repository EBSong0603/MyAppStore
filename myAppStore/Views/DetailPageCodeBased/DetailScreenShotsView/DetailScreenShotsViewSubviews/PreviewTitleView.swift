//  PreviewTitleView.swift
//  myAppStore
//  Created by 송은비 on 2020/11/14.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class PreviewTitleView: ModuleView {
    
    private let PreviewTitle: BasicComponentLabel = {
        let label = BasicComponentLabel(labelStyle: .system20B)
        label.setStyle(title: "미리보기", color: .black)
        return label
    }()
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureAutolayouts() {
        self.addSubview(PreviewTitle)
        PreviewTitle.edges(self)
    }
}
