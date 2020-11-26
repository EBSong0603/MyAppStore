//  DetailViewController.swift
//  myAppStore
//  Created by 송은비 on 2020/10/17.
//  Copyright © 2020 EB. All rights reserved.

import UIKit

class DetailViewController: BaseViewController {
    
    private let viewModel: AppStoreViewModel
    
    private let navBackView: UIView = {
        let navColor = #colorLiteral(red: 0.7813222603, green: 0.7775477566, blue: 0.785096764, alpha: 1)
        let view = UIView()
        view.backgroundColor = UIColor(named: "ColorSetNavibar")!
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
    
    private let appVerietyInfoView: ShortVarietyInfoView = ShortVarietyInfoView()
    private let infomationItems = informationItems()
    
    private let naviTitleView: NaviTitleView = NaviTitleView()
    private let appIconInfoView: AppIconInfoView = AppIconInfoView()
    private let previewTitleView: InfoTitleCategoryView = InfoTitleCategoryView(with: "미리보기", with: nil)
    private let appScreenShotsView: ScreenShotsCollectionView = ScreenShotsCollectionView()
    private let appDescriptionView: AppDescriptionView = AppDescriptionView()
    private let appRatingTitleView: InfoTitleCategoryView = InfoTitleCategoryView(with: "평가 및 리뷰", with: "모두보기")
    private let appRatingReviewView: AppRatingReviewView = AppRatingReviewView()
    private let whatsNewTitleView: InfoTitleCategoryView = InfoTitleCategoryView(with: "새로운 기능", with: "버전기록")
    private let appWhatsNewInfoView: WhatsNewView = WhatsNewView()
    private let informationTitleView: InfoTitleCategoryView = InfoTitleCategoryView(with: "정보", with: nil)
    
    init(with viewModel: AppStoreViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        naviBackgroundViewSetup()
        setNavigationBar()
        prepareScrollView()
        viewsSetup()
        
        if let model: AppStoreModel.ResultsEntry =
            viewModel.inPut.selectedModel {
            setData(with: model)
        }
        
        let furtherButton = appIconInfoView.furtherButton
        furtherButton.addTarget(self, action: #selector(furtherButtonClicked), for: .touchUpInside)
    }
    
    @objc func furtherButtonClicked() {
        let items = ["어플의 정보를 공유하세요!"]
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(ac, animated: true, completion: nil)
    }
    
    private func naviBackgroundViewSetup() {
        
        let navBackViewHeight: CGFloat
        
        let window = UIApplication.shared.windows.filter {
            $0.isKeyWindow
        }.first
        
        let statusBarHeight: CGFloat = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        let navigationBarHeight: CGFloat = self.navigationController?.navigationBar.frame.height ?? 0
        
    
        navBackViewHeight = statusBarHeight + navigationBarHeight
        navBackView.height(navBackViewHeight)
    }
    
    private func viewsSetup() {
        let views = [appIconInfoView, appVerietyInfoView, whatsNewTitleView,
                     appWhatsNewInfoView, previewTitleView, appScreenShotsView,
                     appDescriptionView, appRatingTitleView, appRatingReviewView,
                     informationTitleView]
        
        for view in views {
            if view is InfoTitleCategoryView {
                detailContentVStackView.addArrangedSubview(view)
            } else {
                let separator = HorizonSeperatorView()
                detailContentVStackView.addArrangedSubviews([view, separator])
            }
        }
    }
    
    private func setData(with data: AppStoreModel.ResultsEntry) {
        
        naviTitleView.setData(with: data)
        appIconInfoView.setData(with: data)
        appVerietyInfoView.setData(with: data)
        appScreenShotsView.setData(with: data)
        appDescriptionView.setData(with: data)
        appRatingReviewView.setData(with: data)
        appWhatsNewInfoView.setData(with: data)
        
        infomationItems.setData(with: data)
        let items = infomationItems.items
        
        for item in items {
            let separator = HorizonSeperatorView()
            let informationViews = InformationView()
            informationViews.setItem(with: item)
            detailContentVStackView.addArrangedSubview(informationViews)
            detailContentVStackView.addArrangedSubview(separator)
        }
    }
    
    private func setNavigationBar() {
        
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.barTintColor  = .clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
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

extension DetailViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let contentOffsetY: CGFloat = scrollView.contentOffset.y
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.2, delay: 0
                                                       , options: .beginFromCurrentState, animations: {
                                                        self.navBackView.alpha = (contentOffsetY > 14) ?  0.2 : 0
                                                        (self.navigationItem.titleView, self.naviTitleView.alpha) =
                                                            (contentOffsetY > 104) ? (self.naviTitleView, 1) : (nil, 0)
                                                       })
    }
}
