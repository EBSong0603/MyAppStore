//  StarRatingImageView.swift
//  myAppStore
//  Created by 송은비 on 2020/10/20.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

public enum StarStyle {
    case empty
    case filled
    var rawValue: UIImage {
        switch self {
        case .empty: return UIImage(systemName: "star")!
        case .filled: return UIImage(systemName: "star.fill")!
        }
    }
}
//star rating ImageView 커스텀 클래스로 View 만듬 (StackView)
class StarRatingImageView: ModuleView {
    
    private let starHStackView: UIStackView = {
        let hStackView = UIStackView()
        hStackView.setStackViewStyle(axis: .horizontal, spacing: 2, distribution: .fillProportionally)
        return hStackView
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.setStyle("", textColor: .gray, font: UIFont.systemFont(ofSize: 12), textAlignment: .left)
        return label
    }()
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(with data: AppStoreModel.ResultsEntry?) {
        guard let data = data else {return}
        
        starHStackView.removeAllSubViews()
        var subViews: [UIView] = []
        
        
        let intRating = Int(data.averageUserRating)
        print("intRating: \(intRating)")
        
        //        var imageViews: [UIImageView] = []
        
        for num in 1..<6 {
            let image: UIImage = (num <= intRating) ? StarStyle.filled.rawValue : StarStyle.empty.rawValue
            let imageView: UIImageView = UIImageView(image: image)
            
//            let imageView: UIImageView = (num <= intRating)
//                ? UIImageView.init(image: StarStyle.filled.rawValue)
//                : UIImageView.init(image: StarStyle.empty.rawValue)
            //            imageViews.append(imageView)
            imageView.tintColor = .gray
            imageView.width(12)
            imageView.height(12)
            subViews.append(imageView)
        }
        let userRC: String = data.userRatingCount.formatPoints(from: data.userRatingCount)
        ratingLabel.text = userRC
        subViews.append(ratingLabel)
        //imageView도 label도 다 View 이기때문에 구체적으로 특정해서 imageViews 라는걸 만들지 말고 Uiview로 구성된 SubViews를 만들어서 나중에
        //label까지도 append 시킬수 있도록 해주자~ 효율성!과 집합성을 위해
        starHStackView.addArrangedSubviews(subViews)
        //        starHStackView.addArrangedSubview(ratingLabel)
    }
    //자동으로 오버라이드 되고, init 에 호출해줄 필요 없음, MouduleView에서 이미 해줬고, 그 ModuleView를 상속하고 있기 때문!
    override func configureAutolayouts() {
        
        self.addSubview(starHStackView)
        starHStackView.top(self.topAnchor, constant: 0)
        starHStackView.leading(self.leadingAnchor, constant: 0)
        starHStackView.trailing(self.trailingAnchor, constant: 0)
        starHStackView.bottom(self.bottomAnchor, constant: 0) 
    }
}


