//  SecondShortInformView.swift
//  myAppStore
//  Created by 송은비 on 2020/10/17.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class DetailSecondView: ModuleView, UIScrollViewDelegate {
    
    private let scrollView: UIScrollView = UIScrollView()
    private let hStackView = UIStackView().style(axis: .horizontal, spacing: 50, distribution: .equalCentering)
    private let firstView = DetailSecondViewFirst()
    private let secondView = DetailSecondViewSecond()
    private let thirdView = DetailSEcondViewThird()
    private let forthView = DetailSecondViewForth()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        hStackView.addArrangedSubviews([firstView, secondView, thirdView, forthView])
        scrollView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setData(with data: AppStoreModel.ResultsEntry) {
        firstView.setData(with: data)
        secondView.setData(with: data)
        thirdView.setData(with: data)
        forthView.setData(with: data)
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
