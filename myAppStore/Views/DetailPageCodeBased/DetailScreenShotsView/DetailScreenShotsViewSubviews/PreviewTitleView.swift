//  PreviewTitleView.swift
//  myAppStore
//  Created by 송은비 on 2020/11/14.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class PreviewTitleView: ModuleView {
    
    private let PreviewTitle: UILabel = {
       let label = UILabel()
        label.setStyle("미리보기", textColor: .black, font: UIFont.systemFont(ofSize: 20, weight: .bold))
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
