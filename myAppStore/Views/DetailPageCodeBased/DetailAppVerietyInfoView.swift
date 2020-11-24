//  SecondShortInformView.swift
//  myAppStore
//  Created by 송은비 on 2020/10/17.
//  Copyright © 2020 EB. All rights reserved.

import UIKit

class DetailAppVerietyInfoView: ModuleView, UIScrollViewDelegate {
    
    private let varietyInfoItems = DetailAppVarietyInfoItems()

    private let scrollView: UIScrollView = UIScrollView()
    
    private let hStackView = UIStackView().style(axis: .horizontal, spacing: 10, distribution: .fillProportionally)
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        scrollView.delegate = self
        scrollView.showsHorizontalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setData(with data: AppStoreModel.ResultsEntry) {
       
        varietyInfoItems.setData(with: data)
        
        for item in varietyInfoItems.items {
            let shortInfoView = ShortInfoView(with: item)
            shortInfoView.setData(with: data)
            let separator = VerticalSeperatorView()
            if item.topLabelText != "언어" {
                hStackView.addArrangedSubview(shortInfoView)

                hStackView.addArrangedSubview(separator)
            } else {
                hStackView.addArrangedSubview(shortInfoView)
            }
        }
    }
    
    override func configureAutolayouts() {
        
        self.addSubview(scrollView)
        scrollView.addSubview(hStackView)
        
        scrollView.edges(self, vConstant: 0, hConstant: 16)
        hStackView.top(scrollView.contentLayoutGuide.topAnchor)
        hStackView.leading(scrollView.contentLayoutGuide.leadingAnchor)
        hStackView.trailing(scrollView.contentLayoutGuide.trailingAnchor)
        hStackView.bottom(scrollView.contentLayoutGuide.bottomAnchor)
        hStackView.heightDemension(scrollView.frameLayoutGuide.heightAnchor)
    }
}
