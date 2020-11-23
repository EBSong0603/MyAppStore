//  DetailSecondViewSixthView.swift
//  myAppStore
//  Created by 송은비 on 2020/11/09.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class ShortSizeView: ModuleView {
    
    private let sizeVStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.setStackViewStyle(axis: .vertical, spacing: 2, distribution: .fillEqually)
        stackView.alignment = .center
        return stackView
    }()
    private let infoLabel: UILabel = {
       let label = UILabel()
        label.setStyle("사이즈", textColor: .lightGray, font: UIFont.systemFont(ofSize: 12, weight: .semibold), textAlignment: .center)
        return label
    }()
    private let sizeLabel: UILabel = {
       let label = UILabel()
        label.setStyle("188", textColor: .gray, font: UIFont(name: "Arial Rounded MT Bold", size: 20)! )
        return label
    }()
    private let megaBytesLabel: UILabel = {
       let label = UILabel()
        label.setStyle("MB", textColor: .gray, font: UIFont.systemFont(ofSize: 12), textAlignment: .center)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.height(70)
        self.width(100)
        sizeVStackView.addArrangedSubviews([infoLabel, sizeLabel, megaBytesLabel])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setData(with data: AppStoreModel.ResultsEntry) {
        let intSize = round((data.fileSizeBytes.toDouble) / 1000000)
        sizeLabel.text = "\(intSize)"
    }
    
    override func configureAutolayouts() {
        self.addSubview(sizeVStackView)

        sizeVStackView.edges(self)
    }
}
