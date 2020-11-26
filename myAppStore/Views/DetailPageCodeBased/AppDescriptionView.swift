//  practice.swift
//  myAppStore
//  Created by 송은비 on 2020/10/28.
//  Copyright © 2020 EB. All rights reserved.

import UIKit

class AppDescriptionView: ModuleView {
    
    private let infoLabel: BasicComponentLabel = {
        let label = BasicComponentLabel(labelStyle: .system12)
        label.setStyle(title: "앱디스크립션 내용", color: UIColor(named: "ColorSetBlack")!)
        label.numberOfLines = 3
        return label
    }()
    
    private let moreInfoLabel: BasicComponentLabel = {
        let label = BasicComponentLabel(labelStyle: .system12)
        label.setStyle(title: "더보기", color: UIColor(named: "ColorSetBlue")!)
        label.alpha = 1
        label.isUserInteractionEnabled = false
        return label
    }()
    
    private let backView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.alpha = 0.9
        return view
    }()
    
    private let openDescriptionButtom: UIButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        openDescriptionButtom.addTarget(self, action: #selector(openDescriptionButtonClikced)
                                        , for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func openDescriptionButtonClikced() {
        
        infoLabel.numberOfLines = 0
        UIView.transition(with: self.infoLabel,
                          duration: 0.2,
                          options: .transitionCrossDissolve,
                          animations: {
                            self.moreInfoLabel.alpha = 0
                            self.backView.alpha = 0
                          })
    }
    
    func setData(with data: AppStoreModel.ResultsEntry) {
        
        infoLabel.text = data.description
        infoLabel.numberOfLines = 3
    }
    
    override func configureAutolayouts() {
        
        self.addSubview(openDescriptionButtom)
        openDescriptionButtom.top(self.topAnchor)
        openDescriptionButtom.leading(self.leadingAnchor)
        openDescriptionButtom.bottom(self.bottomAnchor, constant: -20)
        openDescriptionButtom.trailing(self.trailingAnchor)
        openDescriptionButtom.addSubViews([infoLabel, backView, moreInfoLabel])
        infoLabel.edges(openDescriptionButtom, vConstant: 0, hConstant: 16)
        moreInfoLabel.top(infoLabel.topAnchor, constant: 30)
        moreInfoLabel.trailing(openDescriptionButtom.trailingAnchor, constant: -16)
        backView.top(moreInfoLabel.topAnchor, constant: -8)
        backView.leading(moreInfoLabel.leadingAnchor, constant: -8)
        backView.trailing(moreInfoLabel.trailingAnchor, constant: 8)
        backView.bottom(moreInfoLabel.bottomAnchor, constant: 8)
    }
}
