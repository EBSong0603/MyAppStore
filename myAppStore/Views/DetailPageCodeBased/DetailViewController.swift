//  DetailViewController.swift
//  myAppStore
//  Created by 송은비 on 2020/10/17.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class DetailViewController: BaseViewController {
    
    var data: AppStoreModel.ResultsEntry?
    let scrollView: UIScrollView = UIScrollView()

    private let topView: DetailTopView = {
        let view = DetailTopView()
        return view
    }()
    
    private let secondView: DetailSecondView = {
        let view = DetailSecondView()
        return view
    }()
    
    private let thirdView: DetailThirdCapturedImageView = {
        let view = DetailThirdCapturedImageView()
        return view
    }()
    
    private let forthView: DetailForthPhoneView = {
       let view = DetailForthPhoneView()
        return view
    }()
    
    private let fifthView: DetailFifthDiscriptionView = {
       let view = DetailFifthDiscriptionView()
        return view
    }()
    
    private let detailContentVStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        prepareScrollView()
        detailContentVStackView.addArrangedSubviews([topView, secondView, thirdView, forthView, fifthView])
        guard let data = data else {return}
        topView.setData(with: data)
        secondView.setData(with: data)
        thirdView.setData(with: data.screenshotUrls)
        fifthView.setData(with: data)
        view.backgroundColor = .white
    }
    
    private func setNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.barTintColor = .white
    }
    
    private func prepareScrollView() {
        scrollView.delegate = self
    }
    
    override func configureAutolayouts() {
        view.addSubview(scrollView)
        scrollView.addSubview(detailContentVStackView)
  
        scrollView.edges(self.safeArea)
        detailContentVStackView.top(scrollView.contentLayoutGuide.topAnchor)
        detailContentVStackView.leading(scrollView.contentLayoutGuide.leadingAnchor)
        detailContentVStackView.trailing(scrollView.contentLayoutGuide.trailingAnchor)
        detailContentVStackView.bottom(scrollView.contentLayoutGuide.bottomAnchor)
        detailContentVStackView.widthDemension(scrollView.frameLayoutGuide.widthAnchor)
        //만약 가로 스크롤로 바꾸고 싶으면 scrollView.frameLayoutGuide.heightAnchor 로 contraint를 주면됨
        
    }
}

extension DetailViewController: UIScrollViewDelegate {
 
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY: CGFloat = scrollView.contentOffset.y
        print(contentOffsetY)
    }
}
