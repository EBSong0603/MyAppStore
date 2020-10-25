//
//  DetailViewController.swift
//  myAppStore
//
//  Created by 송은비 on 2020/10/17.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
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
        configureAutoLayouts()
        detailContentVStackView.addArrangedSubviews([topView, secondView, thirdView])
        guard let data = data else {return}
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
    
    
    private func configureAutoLayouts() {
        
        let safeArea: UILayoutGuide = view.safeAreaLayoutGuide
        
        
        view.addSubview(scrollView)
        scrollView.addSubview(detailContentVStackView)
        
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        detailContentVStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
            
        ])
        
        NSLayoutConstraint.activate([
            
            detailContentVStackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            detailContentVStackView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            detailContentVStackView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            detailContentVStackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            detailContentVStackView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor)
            
        ])
        
        
    }
    
}

extension DetailViewController: UIScrollViewDelegate {
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY: CGFloat = scrollView.contentOffset.y
        print(contentOffsetY)
    }
    
    
    
}
