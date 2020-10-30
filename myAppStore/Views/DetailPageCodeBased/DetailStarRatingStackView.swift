//  DetailStarRatingStackView.swift
//  myAppStore
//  Created by 송은비 on 2020/10/30.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class DetailStarRatingStackView: ModuleView {
    private let starHStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.setStackViewStyle(axis: .horizontal, spacing: 2, distribution: .fillProportionally)
        stackView.alignment = .center
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(with data: AppStoreModel.ResultsEntry?) {
        guard let data = data else {return}
        
        starHStackView.removeAllSubViews()
        var subViews: [UIView] = []
        let intRating = Int(data.averageUserRating)
        
        for num in 1..<6 {
            let image: UIImage = (num <= intRating) ? StarStyle.filled.rawValue : StarStyle.empty.rawValue
            let imageView: UIImageView = UIImageView(image: image)
            imageView.width(14)
            imageView.height(14)
            imageView.tintColor = .lightGray
            subViews.append(imageView)
            starHStackView.addArrangedSubviews(subViews)
        }
    }
 
    override func configureAutolayouts() {
        
        self.addSubview(starHStackView)
        starHStackView.edges(self)
    }
}
