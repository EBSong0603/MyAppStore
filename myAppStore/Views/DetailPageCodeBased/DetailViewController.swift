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
    
    private let detailContentVStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        prepareScrollView()
        detailContentVStackView.addArrangedSubviews([topView, secondView, thirdView])
        guard let data = data else {return}
        topView.setData(with: data)
        secondView.setData(with: data)
        thirdView.setData(with: data.screenshotUrls)
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
    }
}

extension DetailViewController: UIScrollViewDelegate {
 
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY: CGFloat = scrollView.contentOffset.y
        print(contentOffsetY)
    }
}
