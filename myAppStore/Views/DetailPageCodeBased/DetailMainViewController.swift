//  DetailViewController.swift
//  myAppStore
//  Created by 송은비 on 2020/10/17.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class DetailMainViewController: BaseViewController {
    
    //여기서는 기존의 오리지널 MVVM 방식처럼 ViewModel을 그대로 얻어온 것이 아니라
    //init만 MVVM 방식의 일부로 진행하고, 결국 받은 값은 AppStoreModel.ResultEntry 타입으로 받음 (model로 받음)
    
    //MVVM 방식: 값을 건네 받을때는 init 을 통해서 기본이니셜라이즈를 해놓은 model 에 그 전 화면에서의 ViewModel 값을 받아온다
    //MVVM을 쓴다 = init방식을 통해서 ViewModel을 공유한다
    //그리고 하나의 ViewModel을 공유하는 두개의 뷰사이에는 화면전환이 일어난다.
    //init을 통해서 받아오는 형식이 있지만 결국 하나의 ViewModel을 같이 쓰고 있다고 생각하면됨, 그리고 뒤에서 만약 공유하고 있는 ViewModel에 변화를 준다면 같이 공유하고 있는 앞의 뷰에서도 영향 받게되는것
    //당연히 화면 전환된 화면에서 만든 model의 타입도 ViewModel 로 인스턴스화 되어있음
    //그럼 만약 뒤에서 어떤 변화를 줘서 ViewModel의 값을 바꾸면, 본래 오리지널의 ViewModel의 값이 바뀌게 됨
    
    private let viewModel: AppStoreViewModel
    
    let scrollView: UIScrollView = UIScrollView()
    
    private let detailContentVStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.spacing = 5
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
 
    private let seperatorView: HorizonSeperatorView = HorizonSeperatorView()
    private let seperatorView1: HorizonSeperatorView = HorizonSeperatorView()
    private let seperatorView2: HorizonSeperatorView = HorizonSeperatorView()
    private let seperatorView3: HorizonSeperatorView = HorizonSeperatorView()
    private let seperatorView4: HorizonSeperatorView = HorizonSeperatorView()
    private let seperatorView5: HorizonSeperatorView = HorizonSeperatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        prepareScrollView()
        detailContentVStackView.addArrangedSubviews([appIconInfoView, seperatorView, appVerietyInfoView, seperatorView1, appWhatsNewInfoView, seperatorView2, appScreenShotsView, appDeviceInfoView, seperatorView3, appDescriptionView, seperatorView4, appRatingReviewView, seperatorView5, informationView])

        
        //inPut 모델 데이터에 접근하고 싶으면 일단 viewModel 자체를 이니셜라이즈로 받고! 그 다음에 할수 있음
        //왜냐면 앞에 뷰컨에서 InPut 모델에 값을 넣던, 여기서 그 InPut 데이터 모델을 받아와서 뿌려주던 다 ViewModel을 통해서 하기 땜에!
        //저 아래 접근 방식을 봐, viewModel.inPut.selectedModel이잖아
        //여기에서 셀 클릭되서 배열중에 하나만의 데이터를 다루는 것임
        //어차피 디테일뷰는 그 하나만 다루잖아!
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
         navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.barTintColor  = .clear
        
        

    }
    
    //viewWillLayoutSubviews 델리게이트 이용하면, 화면전환시 검색 큰 글자 바로 사라짐
    override func viewWillLayoutSubviews() {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationItem.largeTitleDisplayMode = .never
//        navigationController?.navigationBar.barTintColor = .white
     
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
        scrollView.addSubview(detailContentVStackView)
  
        scrollView.edges(self.safeArea)
        detailContentVStackView.top(scrollView.contentLayoutGuide.topAnchor)
        detailContentVStackView.leading(scrollView.contentLayoutGuide.leadingAnchor)
        detailContentVStackView.trailing(scrollView.contentLayoutGuide.trailingAnchor)
        detailContentVStackView.bottom(scrollView.contentLayoutGuide.bottomAnchor)
        detailContentVStackView.widthDemension(scrollView.frameLayoutGuide.widthAnchor)
    }
}
//UIScrollViewDelegate 이용해서 네비게이션바 안에 이미지랑 버튼 띄우기
extension DetailMainViewController: UIScrollViewDelegate {
 
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let contentOffsetY: CGFloat = scrollView.contentOffset.y
        print(contentOffsetY)
        if contentOffsetY > 104 {
            self.navigationItem.titleView = naviTitleView   
        } else {
            self.navigationItem.titleView = nil
        }
        
    }
}
