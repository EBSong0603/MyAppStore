//
//  InformationView.swift
//  myAppStore
//
//  Created by 송은비 on 2020/11/12.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit

class InformationTotalView: ModuleView {
    
    private let infoTotalVStackView: UIStackView = {
      let stackView = UIStackView()
        stackView.setStackViewStyle(axis: .vertical, spacing: 10, distribution: .fill)
        return stackView
    }()
    private let informationTitleview: InformationTitleView = InformationTitleView()
    private let providerView: ProvideView = ProvideView()
    private let sizeVew: SizeView = SizeView()
    private let categoryView: CategoryView = CategoryView()
    private let compatiView: CompatibilityView = CompatibilityView()
    private let languagesView: LanguagesView = LanguagesView()
    private let ageRatingView: AgeRatingView = AgeRatingView()
    private var inAppPurchaseView: InAppPurchaseView = InAppPurchaseView()
    private let copyrightView: CopyrightView = CopyrightView()
    private let developerWebsiteView: DeveloperWebsiteView = DeveloperWebsiteView()
    private let privatePolicyView: PrivatePolicyView = PrivatePolicyView()
    
    private let seperateView1: HorizonSeperatorView = HorizonSeperatorView()
    private let seperateview2: HorizonSeperatorView = HorizonSeperatorView()
    private let seperateview3: HorizonSeperatorView = HorizonSeperatorView()
    private let seperateview4: HorizonSeperatorView = HorizonSeperatorView()
    private let seperateview5: HorizonSeperatorView = HorizonSeperatorView()
    private let seperateview6: HorizonSeperatorView = HorizonSeperatorView()
    private let seperateview7: HorizonSeperatorView = HorizonSeperatorView()
    private let seperateview8: HorizonSeperatorView = HorizonSeperatorView()
    private let seperateview9: HorizonSeperatorView = HorizonSeperatorView()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        infoTotalVStackView.addArrangedSubviews([informationTitleview, providerView, seperateView1, sizeVew, seperateview2, categoryView, seperateview3, compatiView, seperateview4, languagesView, seperateview5, ageRatingView, seperateview6, inAppPurchaseView, seperateview7, copyrightView, seperateview8, developerWebsiteView, seperateview9, privatePolicyView])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(with data: AppStoreModel.ResultsEntry) {
        providerView.setData(with: data)
        sizeVew.setData(with: data)
        categoryView.setData(with: data)
        compatiView.setData(with: data)
        languagesView.setData(with: data)
//        ageRatingView.setData(with: data)
        inAppPurchaseView.setData(with: data)
        copyrightView.setData(with: data)

        inAppPurchaseView.isHidden = !data.isGameCenterEnabled
        seperateview7.isHidden = !data.isGameCenterEnabled
//        if data.isGameCenterEnabled == false {
//            inAppPurchaseView.isHidden = true
//            seperateview7.isHidden = true
//        }
        
    }
    
    override func configureAutolayouts() {
        self.addSubview(infoTotalVStackView)
        infoTotalVStackView.edges(self)
    }
    
}
