//
//  practice.swift
//  myAppStore
//
//  Created by 송은비 on 2020/10/28.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit

class DetailFifthDiscriptionView: ModuleView {
    
    
    private let vStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.setStackViewStyle(axis: .vertical, spacing: 10, distribution: .equalSpacing)
        return stackView
    }()
    
    
    
    private let pracView: DetailFifthTopView = {
        let view = DetailFifthTopView()
        return view
    }()
    
    
    private let ppbutton: UIButton = {
       let button = UIButton()
        button.setTitle("ㅎㅎㅎㅎㅎ", for: .normal)
        return button
        
    }()
    
    private let longLabel: UILabel = {
        
       let label = UILabel()
        label.setStyle("dkdkdkdk", textColor: .black, font: UIFont.systemFont(ofSize: 15))
        label.numberOfLines = 0
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .yellow
        longLabel.isHidden = true
        vStackView.addArrangedSubviews([pracView, longLabel])
        ppbutton.addTarget(self, action: #selector(clickec), for: .touchUpInside)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func clickec() {
        longLabel.isHidden = !longLabel.isHidden
        pracView.moreInfoLabel.isHidden = true
        
    }
    
    
    func setData(with data: AppStoreModel.ResultsEntry) {
        longLabel.text = data.description
    }
    
    override func configureAutolayouts() {
        self.addSubview(vStackView)
        self.addSubview(ppbutton)
        vStackView.edges(self, vConstant: 0, hConstant: 16)
        ppbutton.edges(self)
    }
    
}
