//  SecondShortInformView.swift
//  myAppStore
//  Created by 송은비 on 2020/10/17.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class DetailAppVerietyInfoView: ModuleView, UIScrollViewDelegate {
    
    private let scrollView: UIScrollView = UIScrollView()
    
    private let hStackView = UIStackView().style(axis: .horizontal, spacing: 10, distribution: .fillProportionally)
    private let reviewsView = ShortReviewView()
    private let ageView = ShortAgeView()
    private let chartView = ShortChartView()
    private let developerView = ShortDeveloperView()
    private let languagesView = ShortLanguagesView()
    private let appSizeView = ShortSizeView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        let views = [reviewsView, ageView, chartView, developerView, languagesView, appSizeView]
 
        for (index, view) in views.enumerated() {
            if index != 5 {
                let seperator = VerticalSeperatorView()
                hStackView.addArrangedSubview(view)
                hStackView.addArrangedSubview(seperator)
            } else {
                hStackView.addArrangedSubview(view)
            }
        }
        scrollView.delegate = self
        scrollView.showsHorizontalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setData(with data: AppStoreModel.ResultsEntry) {
        reviewsView.setData(with: data)
        ageView.setData(with: data)
        chartView.setData(with: data)
        developerView.setData(with: data)
        languagesView.setData(with: data)
        appSizeView.setData(with: data)
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
