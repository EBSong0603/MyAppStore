////  InformationView.swift
////  myAppStore
////  Created by 송은비 on 2020/11/18.
////  Copyright © 2020 EB. All rights reserved.
//
//import UIKit
//
//class InformationView: ModuleView {
//
//    private let infoVStackView: UIStackView = {
//        let stacView = UIStackView()
//        stacView.setStackViewStyle(axis: .vertical, distribution: .equalSpacing)
//        return stacView
//    }()
//
//    private let openButton = UIButton(type: .custom)
//
//    private let infoTitleValueView: InfoTitleValueView = InfoTitleValueView()
//
//    private let infoDescriptionView: InfoDescriptionView = InfoDescriptionView()
//
//    init(with item: InfoItem) {
//        super.init(frame: .zero)
//
//        self.backgroundColor = .white
//        setData(with: item)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    private func setData(with item: InfoItem) {
//
//        infoTitleValueView.setData(with: item)
//
//        if item.isArrow {
//            infoVStackView.addArrangedSubview(infoDescriptionView)
//            infoDescriptionView.setData(with: item)
//            infoDescriptionView.isHidden = true
//            self.addSubview(openButton)
//            openButton.edges(infoVStackView)
//            openButton.addTarget(self, action: #selector(openButtonClicked), for: .touchUpInside)
//        }
//    }
//
//    @objc private func openButtonClicked() {
//
//        infoDescriptionView.isHidden = false
//        UIView.transition(with: self.infoDescriptionView, duration: 0.1, options: .transitionCrossDissolve, animations: {
//            self.infoTitleValueView.infoValueLabel.alpha = 0
//            self.infoTitleValueView.arrowImageView.isHidden = true
//        })
//    }
//
//    override func configureAutolayouts() {
//        self.addSubview(infoVStackView)
//        infoVStackView.edges(self)
//        infoVStackView.addArrangedSubviews([infoTitleValueView])
//    }
//}
