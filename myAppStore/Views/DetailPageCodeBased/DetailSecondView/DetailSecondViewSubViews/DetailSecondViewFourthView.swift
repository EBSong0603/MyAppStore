//  DetailSecondViewThird.swift
//  myAppStore
//  Created by 송은비 on 2020/10/28.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class DetailSecondViewFourthView: ModuleView {
    
    private let developerInfoVStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.setStackViewStyle(axis: .vertical, spacing: 2, distribution: .fillEqually)
        stackView.alignment = .center
        return stackView
    }()
    private let devLabel: UILabel = {
        let label = UILabel()
        label.setStyle("개발자", textColor: .lightGray, font: UIFont.systemFont(ofSize: 15), textAlignment: .center)
        return label
    }()
    private let devImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star.fill")
        imageView.height(20)
        imageView.width(20)
        imageView.tintColor = .gray
        return imageView
    }()
    private let devName: UILabel = {
        let label = UILabel()
        label.setStyle("아무개", textColor: .lightGray, font: UIFont.systemFont(ofSize: 15), textAlignment: .center)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        developerInfoVStackView.addArrangedSubviews([devLabel, devImageView, devName])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(with data: AppStoreModel.ResultsEntry) {
        devName.text = data.artistName
    }
    
    override func configureAutolayouts() {
        
        self.addSubview(developerInfoVStackView)
        developerInfoVStackView.edges(self)
    }
}
