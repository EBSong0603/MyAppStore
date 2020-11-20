//  DetailViewController.swift
//  myAppStore
//  Created by 송은비 on 2020/10/17.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class DetailMainViewController: BaseViewController {
    
    private let viewModel: AppStoreViewModel
    
    private let navBackView: UIView = {
        let navColor = #colorLiteral(red: 0.7813222603, green: 0.7775477566, blue: 0.785096764, alpha: 1)
        let view = UIView()
        view.backgroundColor = navColor
        view.alpha = 0
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
   
    
    private let scrollView: UIScrollView = UIScrollView()
    private let detailContentVStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.setStackViewStyle(axis: .vertical, spacing: 5, distribution: .equalSpacing)
        return stackView
    }()
    private let appIconInfoView: DetailAppIconInfoView = DetailAppIconInfoView()
    private let appVerietyInfoView: DetailAppVerietyInfoView = DetailAppVerietyInfoView()
    private let appScreenShotsView: DetailScreenShotsView = DetailScreenShotsView()
    private let appDeviceInfoView: DetailDeviceInfoView = DetailDeviceInfoView()
    private let appDescriptionView: DetailAppDescriptionView = DetailAppDescriptionView()
    private let appRatingReviewView: DetailAppRatingReviewView = DetailAppRatingReviewView()
    private let appWhatsNewInfoView: WhatsNewInformationView = WhatsNewInformationView()
    private let informationView: InformationTotalView = InformationTotalView()
    
    private let naviTitleView: NaviTitleView = NaviTitleView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        let navBackViewHeight: CGFloat
        let window = UIApplication.shared.windows.filter {
            $0.isKeyWindow
        }.first
        let statusBarHeight: CGFloat = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        let navigationBarHeight: CGFloat = self.navigationController?.navigationBar.frame.height ?? 0
        navBackViewHeight = statusBarHeight + navigationBarHeight
        navBackView.height(navBackViewHeight)
        setNavigationBar()
        prepareScrollView()
        
        let views = [appIconInfoView, appVerietyInfoView, appWhatsNewInfoView, appScreenShotsView,
                     appDeviceInfoView, appDescriptionView, appRatingReviewView, informationView]
        
        for (index, view) in views.enumerated() {
            if index != 3, index != 7 {
                let seperator = HorizonSeperatorView()
                detailContentVStackView.addArrangedSubview(view)
                detailContentVStackView.addArrangedSubview(seperator)
            } else {
                detailContentVStackView.addArrangedSubview(view)
            }
        }
        if let model: AppStoreModel.ResultsEntry = viewModel.inPut.selectedModel {
            naviTitleView.setData(with: model)
            appIconInfoView.setData(with: model)
            appVerietyInfoView.setData(with: model)
            appScreenShotsView.setData(with: model.screenshotUrls)
            appDescriptionView.setData(with: model)
            appRatingReviewView.setData(with: model)
            appWhatsNewInfoView.setData(with: model)
            informationView.setData(with: model)
        }
    }
    
    func setNavigationBar() {
        
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.barTintColor  = .clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    //viewWillLayoutSubviews 델리게이트 이용하면, 화면전환시 검색 큰 글자 바로 사라짐
    override func viewWillLayoutSubviews() {
        
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.barTintColor  = .clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    //여기서 init 으로 그전에 뷰컨에서 넘겨줬던 viewModel 받아서 내가 만든 viewModel 변수에 넣어줌 (이니셜라이즈 방식)
    init(with viewModel: AppStoreViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func prepareScrollView() {
        scrollView.delegate = self
    }
    
    override func configureAutolayouts() {
        
        view.addSubview(scrollView)
        view.addSubview(navBackView)
        scrollView.addSubview(detailContentVStackView)
        
        navBackView.top(view.topAnchor)
        navBackView.leading(view.leadingAnchor)
        navBackView.trailing(view.trailingAnchor)
        
        scrollView.top(navBackView.bottomAnchor)
        scrollView.leading(view.leadingAnchor)
        scrollView.trailing(view.trailingAnchor)
        scrollView.bottom(view.bottomAnchor)
        
        detailContentVStackView.top(scrollView.contentLayoutGuide.topAnchor)
        detailContentVStackView.leading(scrollView.contentLayoutGuide.leadingAnchor)
        detailContentVStackView.trailing(scrollView.contentLayoutGuide.trailingAnchor)
        detailContentVStackView.bottom(scrollView.contentLayoutGuide.bottomAnchor)
        detailContentVStackView.widthDemension(scrollView.frameLayoutGuide.widthAnchor)
    }
}

extension DetailMainViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let contentOffsetY: CGFloat = scrollView.contentOffset.y
        print(contentOffsetY)
        
//        let blurEffect = UIBlurEffect(style: .light)
//        let blurView = UIVisualEffectView(effect: blurEffect)
//        blurView.frame = navBackView.frame
//        navBackView.addSubview(blurView)

//        if contentOffsetY > 14 {
//            let blurEffect = UIBlurEffect(style: .dark)
//            let blurView = UIVisualEffectView(effect: blurEffect)
//            blurView.frame = navBackView.bounds
//            blurView.alpha = 0.5
//            navBackView.addSubview(blurView)
//            navBackView.alpha = 0
//            
//        }
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.2, delay: 0
                                                       , options: .beginFromCurrentState, animations: {
            self.navBackView.alpha = (contentOffsetY > 14) ?  0.2 : 0
            (self.navigationItem.titleView, self.naviTitleView.alpha) =
                (contentOffsetY > 104) ? (self.naviTitleView, 1) : (nil, 0)
        })
    }
}
