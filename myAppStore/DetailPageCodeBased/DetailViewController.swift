//
//  DetailViewController.swift
//  myAppStore
//
//  Created by 송은비 on 2020/10/17.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    let scrollView: UIScrollView = UIScrollView()
    
    private let detailContentStackView: UIStackView = {
        
        
        
        
        let label: UILabel = {
            
            let label = UILabel()
            label.text = "안녕"
            label.backgroundColor = .yellow
            
            return label
        }()
        
        let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "이미지")
            return imageView
        }()
        
        let topView: DetailTopView = {
            let view = DetailTopView()
            return view
            
        }()
        
        let secondView: DetailSecondView = {
            let view = DetailSecondView()
            return view
            
        }()
        
        let thirdView: DetailThirdCapturedImageView = {
           let view = DetailThirdCapturedImageView()
            return view
            
        }()
        
        let stackView = UIStackView(arrangedSubviews: [topView, secondView, thirdView])
        stackView.axis = .vertical
        //stackView distribution 찾아보기
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        return stackView
        
    }()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setNavigationBar()
        prepareScrollView()
        configureAutoLayouts()
        
        
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
        scrollView.addSubview(detailContentStackView)
        
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        detailContentStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
            
        ])
        
        NSLayoutConstraint.activate([
            
            detailContentStackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            detailContentStackView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            detailContentStackView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            detailContentStackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            detailContentStackView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor)
            
        ])
        
        
    }
    
}

extension DetailViewController: UIScrollViewDelegate {
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY: CGFloat = scrollView.contentOffset.y
        print(contentOffsetY)
    }
    
    
    
}
