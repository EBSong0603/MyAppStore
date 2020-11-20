//  practice.swift
//  myAppStore
//  Created by 송은비 on 2020/10/28.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class DetailAppDescriptionView: ModuleView {
    
    private let infoLabel: UILabel = {
      let label = UILabel()
        label.setStyle("앱디스크립션 내용", textColor: .black, font: UIFont.systemFont(ofSize: 12))
        label.numberOfLines = 3
        
        return label
    }()
    
    private let moreInfoLabel: UILabel = {
       let label = UILabel()
        label.setStyle("더보기", textColor: .systemBlue, font: UIFont.systemFont(ofSize: 12))
        label.backgroundColor = .white
        label.alpha = 1
        return label
    }()

    private let backView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.alpha = 0.4
        return view
    }()
    
    private let openDescriptionButtom: UIButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        openDescriptionButtom.addTarget(self, action: #selector(openDescriptionButtonClikced)
                                        , for: .touchUpInside)
         }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func openDescriptionButtonClikced() {

        infoLabel.numberOfLines = 0
        UIView.transition(with: self.infoLabel,
                          duration: 0.2,
                          options: .transitionCrossDissolve,
                          animations: {
                            self.moreInfoLabel.alpha = 0
        })
    }
    
    func setData(with data: AppStoreModel.ResultsEntry) {
    
        infoLabel.text = data.description
        infoLabel.numberOfLines = 3
    }
    
    override func configureAutolayouts() {
        
        // =========== 버튼이 레이블보다 아래 있을때 버튼이 먹음, 그런데 더보기 레이블 쪽만 누르면 버튼 안먹음 ======//
        self.addSubview(openDescriptionButtom)
        openDescriptionButtom.top(self.topAnchor)
        openDescriptionButtom.leading(self.leadingAnchor)
        openDescriptionButtom.bottom(self.bottomAnchor, constant: -20)
        openDescriptionButtom.trailing(self.trailingAnchor)
        openDescriptionButtom.addSubViews([infoLabel, moreInfoLabel])
        self.addSubview(backView)
 
        infoLabel.edges(openDescriptionButtom, vConstant: 0, hConstant: 16)
        moreInfoLabel.top(infoLabel.topAnchor, constant: 15)
        moreInfoLabel.trailing(self.trailingAnchor, constant: -16)
        
        backView.edges(moreInfoLabel, vConstant: 8, hConstant: 8)
        

        
        
        
        
        //======= 버튼이 레이블보다 앞에 나오게 레이아웃을 짜면 버튼이 안먹음 (아래코드)====== //
//
//        self.addSubview(infoLabel)
//        infoLabel.top(self.topAnchor)
//        infoLabel.leading(self.leadingAnchor, constant: 16)
//        infoLabel.trailing(self.trailingAnchor, constant: -16)
//        infoLabel.bottom(self.bottomAnchor, constant: -20)
//        infoLabel.addSubViews([openDescriptionButtom, backView])
//
//        openDescriptionButtom.edges(infoLabel)
//        backView.addSubview(moreInfoLabel)
//        moreInfoLabel.edges(backView, vConstant: 4, hConstant: 8)
//        backView.top(infoLabel.topAnchor, constant: 20)
//        backView.trailing(self.trailingAnchor, constant: -16)
        
        
    }
}
