//  RatingStarStackView.swift
//  myAppStore
//  Created by 송은비 on 2020/11/02.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class BasicRatingStarView: ModuleView {
    
    enum StarStyle {
        case small
        case middle
        case large
        
        var rawValue: (imageName: String, size: CGFloat, tintColor: UIColor) {
            switch self {
            case .small: return ("star", 8, UIColor(named: "ColorSetGray")!)
            case .middle: return ("star", 12, UIColor(named: "ColorSetGray")!)
            case .large: return ("star", 14, UIColor(named: "ColorSetGray")!)
            }
        }
    }
    
    private let starHStackView: UIStackView = {
        let hStackView = UIStackView()
        hStackView.setStackViewStyle(axis: .horizontal, spacing: 2, distribution: .fillProportionally)
        hStackView.alignment = .center
        return hStackView
    }()
    
    private let style: StarStyle
    private let count: Int
    
    init(starStyle: StarStyle, count: Int) {
        self.style = starStyle
        self.count = count
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setData(with data: AppStoreModel.ResultsEntry?) {
        starHStackView.removeAllSubViews()
        
        var subViews: [UIView] = []
        if let data = data {
            let intRating = Int(data.averageUserRating)
            
            for num in 1...count {
                let filled: Bool = (num <= intRating)
                let imageView: UIImageView = setStarImageView(isFilled: filled)
                subViews.append(imageView)
            }
        } else {
            for _ in 1...count {
                let imageView: UIImageView = setStarImageView(isFilled: true)
                subViews.append(imageView)
            }
        }
        starHStackView.addArrangedSubviews(subViews)
    }
    
    private func setStarImageView(isFilled: Bool) -> UIImageView {
        let imageView: UIImageView = UIImageView()
        var imageName: String = style.rawValue.imageName
        
        if isFilled {
            imageName.append(".fill")
        }
        imageView.image = UIImage(systemName: imageName)!
        imageView.size(style.rawValue.size)
        imageView.tintColor = style.rawValue.tintColor
        return imageView
    }
    
    override func configureAutolayouts() {
        self.addSubview(starHStackView)
        
        starHStackView.top(self.topAnchor, constant: 0)
        starHStackView.leading(self.leadingAnchor, constant: 0)
        starHStackView.trailing(self.trailingAnchor, constant: 0)
        starHStackView.bottom(self.bottomAnchor, constant: 0)
    }
}

