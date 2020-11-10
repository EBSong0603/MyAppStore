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
    
    private let model: AppStoreModel.ResultsEntry
    
    let scrollView: UIScrollView = UIScrollView()
    
    private let detailContentVStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    private let topView: DetailTopView = DetailTopView()
    private let secondView: DetailSecondView = DetailSecondView()
    private let thirdView: DetailThirdView = DetailThirdView()
    private let forthView: DetailFourthView = DetailFourthView()
    private let fifthView: DetailFifthView = DetailFifthView()
    private let sixthView: DetailSixthView = DetailSixthView()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareScrollView()
        detailContentVStackView.addArrangedSubviews([topView, secondView, thirdView, forthView, fifthView, sixthView])
        
        topView.setData(with: model)
        secondView.setData(with: model)
        thirdView.setData(with: model.screenshotUrls)
        fifthView.setData(with: model)
        sixthView.setData(with: model)
        view.backgroundColor = .white
    }
    
    override func viewWillLayoutSubviews() {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.barTintColor = .white
    }

    init(with data: AppStoreModel.ResultsEntry) {
        self.model = data
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
extension DetailMainViewController: UIScrollViewDelegate {
 
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY: CGFloat = scrollView.contentOffset.y
        print(contentOffsetY)
    }
}
