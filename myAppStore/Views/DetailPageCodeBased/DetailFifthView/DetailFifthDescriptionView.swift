//  practice.swift
//  myAppStore
//  Created by 송은비 on 2020/10/28.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class DetailFifthDescriptionView: ModuleView {
    
    private let vStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.setStackViewStyle(axis: .vertical, spacing: 5, distribution: .equalSpacing)
        return stackView
    }()
    private let bottomDescriptionView: DetailFifthTopView = {
        let view = DetailFifthTopView()
        return view
    }()
    private let longLabel: UILabel = {
        let label = UILabel()
        label.setStyle("dkdkdkdk", textColor: .black, font: UIFont.systemFont(ofSize: 12))
        label.numberOfLines = 0
        return label
    }()
    
    private let openDescriptionButtom: UIButton = {
        let button = UIButton()
        button.setTitle("ㅎㅎㅎㅎㅎ", for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        longLabel.isHidden = true
        vStackView.addArrangedSubviews([bottomDescriptionView, longLabel])
        openDescriptionButtom.addTarget(self, action: #selector(openDescriptionButtonClikced), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func openDescriptionButtonClikced() {
        longLabel.isHidden = !longLabel.isHidden
        UIView.transition(with: self.bottomDescriptionView.moreInfoLabel,
                          duration: 0.1,
                          options: .transitionCrossDissolve,
                          animations: {
                            self.bottomDescriptionView.moreInfoLabel.alpha = 0
        })
    }
    
    func setData(with data: AppStoreModel.ResultsEntry) {
        longLabel.text = data.description
    }
    
    override func configureAutolayouts() {
        self.addSubview(vStackView)
        self.addSubview(openDescriptionButtom)
        vStackView.edges(self, vConstant: 0, hConstant: 16)
        openDescriptionButtom.edges(self)
    }
}
