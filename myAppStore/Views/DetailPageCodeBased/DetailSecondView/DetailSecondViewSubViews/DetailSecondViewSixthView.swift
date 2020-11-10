//  DetailSecondViewSixthView.swift
//  myAppStore
//  Created by 송은비 on 2020/11/09.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class DetailSecondViewSixthView: ModuleView {
    
    private let sizeVStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.setStackViewStyle(axis: .vertical, spacing: 2, distribution: .fillEqually)
        stackView.alignment = .center
        return stackView
    }()
    private let infoLabel: UILabel = {
       let label = UILabel()
        label.setStyle("사이즈", textColor: .lightGray, font: UIFont.systemFont(ofSize: 14), textAlignment: .center)
        return label
    }()
    private let sizeLabel: UILabel = {
       let label = UILabel()
        label.setStyle("188", textColor: .gray, font: UIFont.systemFont(ofSize: 20))
        return label
    }()
    private let megaBytesLabel: UILabel = {
       let label = UILabel()
        label.setStyle("MB", textColor: .lightGray, font: UIFont.systemFont(ofSize: 14), textAlignment: .center)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
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
