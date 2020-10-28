//  SecondShortInformView.swift
//  myAppStore
//  Created by 송은비 on 2020/10/17.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class DetailSecondView: ModuleView, UIScrollViewDelegate {
    
    //1. 스택뷰안의 스택뷰를 넣는다
    //만약 스택뷰를 스크롤되게 할거면 일단 지금여기 detailSecondView에다가 스크롤뷰를 올리고 그 스크롤뷰 위에 total 스택뷰를 올린다
    //그 다음 total 스택뷰 위에 각각 스택뷰를 또 올려준다(ratingVStackView, similarInfoVStackView, ageVStackView...그외)
    //그렇다면 마지막에 올릴 각각 스택뷰는 width가 있어야지 fillpropotionally가 되지 않을까?
    
    //2. 각각의 스택뷰를 품은 뷰를 하나씩 만들어서 그 뷰를 조립해서 하나의 total 스택뷰를 만든다, 그리고 그 total 스택뷰를 스크롤뷰 위에 올려주기
    //만약 안된다면 스택으로 쌓은 하나하나의 뷰를 (정사각형작은 셀) 4개 만들어서 걔를 하나의 total 스택뷰에 올려서 만들어 보던지!(노가다)

    
    private let scrollView: UIScrollView = UIScrollView()
    
    private let firstView = DetailSecondViewFirst()
    private let secondView = DetailSecondViewSecond()
    private let thirdView = DetailSEcondViewThird()
    private let forthView = DetailSecondViewForth()
    
    private let hStackView = UIStackView().style(axis: .horizontal, spacing: 10, distribution: .fillProportionally)
//
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.heightAnchor.constraint(equalToConstant: 60).isActive = true
//        ratingVStackView.addArrangedSubviews([ratingView,reviewCountLabel])
//        similarInfoVStackView.addArrangedSubviews([countLabel, categoryLabel])
//        ageVStackView.addArrangedSubviews([ageLabel, infoLabel])
        self.backgroundColor = .white
        hStackView.addArrangedSubviews([firstView, secondView, thirdView, forthView])
        scrollView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setData(with data: AppStoreModel.ResultsEntry) {
//        let userRC: String = data.userRatingCount.formatPoints(from: data.userRatingCount)
//        reviewCountLabel.text = userRC + " " + "Ratings"
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let contentOffSetY: CGFloat = scrollView.contentOffset.y
//        print(contentOffSetY)
    }
}
