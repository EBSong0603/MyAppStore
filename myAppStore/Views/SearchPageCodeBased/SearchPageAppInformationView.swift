//  File.swift
//  myAppStore
//  Created by 송은비 on 2020/10/17.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class SearchPageAppInformationView: ModuleView {
    
    var isGame: Bool = false
    
    private var appIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.setImageViewStyle(UIImage(named: "DearMeAppIcon")!,
                                    radius: 14, tintColor: .clear, contentMode: .scaleAspectFill)
        return imageView
    }()
    //위의 스택뷰 코드는 그냥 간단한것을 이니셜라이즈하기엔 코드가 복잡함
    //그래서 stackView extension에서 새로 반환값이 있는 함수를 지정해주고 그것으로 코드를 아래와 같이 간결하게 만들었다!(return 따로 해줄필요xx)
    private let appContentsStackView = UIStackView().style(axis: .vertical, spacing: 0, distribution: .fillEqually)
    private let appNameLabel: BasicLabel = {
        let label = BasicLabel(.appTitle)
        label.setStyle(.appTitle, text: "앱이름")
        return label
    }()
    private let appCategoryLabel: BasicLabel = {
        let label = BasicLabel(.subTitle)
        label.setStyle(.subTitle, text: "카테고리이름")
        return label
    }()  
    private let starRatingView: RatingContentsView = {
        let view = RatingContentsView()
        return view
    }()
    
    private let downLoadButton: BasicGetButton = {
        let button = BasicGetButton(.lightGray)
        button.setStyle(.lightGray, title: "받기")
        button.setInsets(vertical: 5, horizonal: 16)
        return button
    }()
    
    private let appPurchaseLabel: BasicLabel = {
        let label = BasicLabel(.purchase)
        label.setStyle(.purchase, text: "앱내구입")
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        appContentsStackView.addArrangedSubviews([appNameLabel, appCategoryLabel, starRatingView])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setData(with data: AppStoreModel.ResultsEntry?) {
        
        guard let data = data else {return}
        starRatingView.setData(with: data)
        appNameLabel.text = data.trackName
        appCategoryLabel.text = data.genres.joined(separator: ",")
        let appIcon = data.artworkUrl512
        appIconImageView.load(with: appIcon)
        appPurchaseLabel.isHidden = !data.isGameCenterEnabled
        //위의 코드와 아래 코드는 같다 -> 두개의 Bool 값이 서로 반대되는 중이잖어
//        if data.isGameCenterEnabled == true {
//            appPurchaseLabel.isHidden = false
//        } else {
//            appPurchaseLabel.isHidden = true
//        }
    }
    
    override func configureAutolayouts() {
        let ratio: CGFloat = (UIScreen.main.bounds.width / 375)
        
        self.addSubViews([appIconImageView, appContentsStackView, downLoadButton, appPurchaseLabel])
        
        appIconImageView.top(self.topAnchor, constant: 16)
        appIconImageView.leading(self.leadingAnchor, constant: 16)
        appIconImageView.bottom(self.bottomAnchor, constant: -16)
        appIconImageView.height(60)
        appIconImageView.width(60)
        
        appContentsStackView.centerY(appIconImageView.centerYAnchor)
        appContentsStackView.leading(appIconImageView.trailingAnchor, constant: 8)
        appContentsStackView.width(200 * ratio)

        downLoadButton.trailing(self.trailingAnchor, constant: -16)
        downLoadButton.centerY(self.centerYAnchor)
        downLoadButton.leading(appContentsStackView.trailingAnchor, constant: 16)
        
        appPurchaseLabel.top(downLoadButton.bottomAnchor, constant: 4)
        appPurchaseLabel.trailing(downLoadButton.trailingAnchor)
        appPurchaseLabel.leading(downLoadButton.leadingAnchor)
    }
}
