//  practice.swift
//  myAppStore
//  Created by 송은비 on 2020/10/28.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class DetailFifthView: ModuleView {
    
    private let vStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.setStackViewStyle(axis: .vertical, spacing: 5, distribution: .equalSpacing)
        return stackView
    }()
    private let topView = DetailFifthViewTopView()
    private let bottomView = DetailFifthViewBottmView()
    
    private let openDescriptionButtom: UIButton = {
        let button = UIButton()
        button.setTitle("ㅎㅎㅎㅎㅎ", for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        bottomView.isHidden = false
        vStackView.addArrangedSubviews([topView, bottomView])
        openDescriptionButtom.addTarget(self, action: #selector(openDescriptionButtonClikced), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func openDescriptionButtonClikced() {
        bottomView.isHidden = !bottomView.isHidden
        UIView.transition(with: self.topView.moreInfoLabel,
                          duration: 0.1,
                          options: .transitionCrossDissolve,
                          animations: {
                            self.topView.moreInfoLabel.alpha = 0
        })
    }
    
    func setData(with data: AppStoreModel.ResultsEntry) {
        let forbottomViewDescription = data.description
      
        let firstIndix = forbottomViewDescription.index(forbottomViewDescription.startIndex, offsetBy: 0)
        let lastItdenx = forbottomViewDescription.index(forbottomViewDescription.startIndex, offsetBy: 50)
        let mobCom = "\(forbottomViewDescription[firstIndix..<lastItdenx])"
        
        let bottomFirstIndex = forbottomViewDescription.index(forbottomViewDescription.startIndex, offsetBy: 50)
        let bottomLastIndex  = forbottomViewDescription.index(forbottomViewDescription.endIndex, offsetBy: 0)
        let bottomMobCom = "\(forbottomViewDescription[bottomFirstIndex..<bottomLastIndex])"
        bottomView.longLabel.text = bottomMobCom
        topView.shortInfoLabel.text = mobCom
        
    }
    
    override func configureAutolayouts() {
        self.addSubview(vStackView)
        self.addSubview(openDescriptionButtom)
        vStackView.edges(self, vConstant: 0, hConstant: 16)
        openDescriptionButtom.edges(self)
    }
}
