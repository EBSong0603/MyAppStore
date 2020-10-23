//  StarRatingImageView.swift
//  myAppStore
//  Created by 송은비 on 2020/10/20.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

public enum StarStyle {
    case empty
    case filled
    
    var rawValue: (UIImage) {
        switch self {
        case .empty: return (UIImage(systemName: "star")!)
        case .filled: return (UIImage(systemName: "star.fill")!)
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
    private let starFirstImageView: UIImageView = {
        let imageView = UIImageView()

        imageView.setImageViewStyle(UIImage(systemName: "star")!, tintColor: .gray, contentMode: .scaleAspectFill)
        imageView.height(12)
        imageView.width(12)
        return imageView
    }()
    private let starSecondImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.setImageViewStyle(UIImage(systemName: "star")!, tintColor: .gray, contentMode: .scaleAspectFill)
        imageView.height(12)
        imageView.width(12)
        return imageView
    }()
    private let starThirdImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.setImageViewStyle(UIImage(systemName: "star")!, tintColor: .gray, contentMode: .scaleAspectFill)
        imageView.height(12)
        imageView.width(12)
        return imageView
    }()
    private let starForthImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.setImageViewStyle(UIImage(systemName: "star")!, tintColor: .gray, contentMode: .scaleAspectFill)
        imageView.height(12)
        imageView.width(12)
        return imageView
    }()
    private let starFifthImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.setImageViewStyle(UIImage(systemName: "star")!, tintColor: .gray, contentMode: .scaleAspectFill)
        imageView.height(12)
        imageView.width(12)
        return imageView
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.setStyle("", textColor: .gray, font: UIFont.systemFont(ofSize: 12), textAlignment: .left)
        return label
    }()
    
    init() {
        super.init(frame: .zero)
       
        starHStackView.addArrangedSubviews([starFirstImageView, starSecondImageView,
                                            starThirdImageView, starForthImageView,
                                            starFifthImageView, ratingLabel])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(with data: AppStoreModel.ResultsEntry?) {
        guard let data = data else {return}
        ratingLabel.text = "\(data.userRatingCount)"
        
        let intRating = Int(data.averageUserRating)
        print("intRating: \(intRating)")
        
        if intRating == 1 {
            starFirstImageView.image = UIImage(systemName: "star.fill")
            starSecondImageView.image = UIImage(systemName: "star")
            starThirdImageView.image = UIImage(systemName: "star")
            starForthImageView.image = UIImage(systemName: "star")
            starFifthImageView.image = UIImage(systemName: "star")
            
        } else if intRating == 2 {
            starFirstImageView.image = UIImage(systemName: "star.fill")
            starSecondImageView.image = UIImage(systemName: "star.fill")
            starThirdImageView.image = UIImage(systemName: "star")
            starForthImageView.image = UIImage(systemName: "star")
            starFifthImageView.image = UIImage(systemName: "star")
            
        } else if intRating == 3 {
            starFirstImageView.image = UIImage(systemName: "star.fill")
            starSecondImageView.image = UIImage(systemName: "star.fill")
            starThirdImageView.image = UIImage(systemName: "star.fill")
            starForthImageView.image = UIImage(systemName: "star")
            starFifthImageView.image = UIImage(systemName: "star")
        } else if intRating == 4 {
            starFirstImageView.image = UIImage(systemName: "star.fill")
            starSecondImageView.image = UIImage(systemName: "star.fill")
            starThirdImageView.image = UIImage(systemName: "star.fill")
            starForthImageView.image = UIImage(systemName: "star.fill")
            starFifthImageView.image = UIImage(systemName: "star")
        } else if intRating == 5 {
            starFirstImageView.image = UIImage(systemName: "star.fill")
            starSecondImageView.image = UIImage(systemName: "star.fill")
            starThirdImageView.image = UIImage(systemName: "star.fill")
            starForthImageView.image = UIImage(systemName: "star.fill")
            starFifthImageView.image = UIImage(systemName: "star.fill")
        }
        
        //        var views: [UIImage] = []
        //        for num in 1..<6 {
        //            let imageView = (num <= intRating) ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
        //            views.append((imageView ?? UIImage(named: "이미지"))!)
        //
        
        //            starFirstImageView.image = imageView
        //            starSecondImageView.image = imageView
        //            starThirdImageView.image = imageView
        //            starForthImageView.image = imageView
        //            starFifthImageView.image = imageView
        //            if num <= intRating {
        //                starFirstImageView.image = UIImage(systemName: "star.fill")
        //                starSecondImageView.image = UIImage(systemName: "star.fill")
        //                starThirdImageView.image = UIImage(systemName: "star.fill")
        //                starForthImageView.image = UIImage(systemName: "star.fill")
        //                starFifthImageView.image = UIImage(systemName: "star.fill")
        //
        //            } else {
        //                starFirstImageView.image = UIImage(systemName: "star")
        //                starSecondImageView.image = UIImage(systemName: "star")
        //                starThirdImageView.image = UIImage(systemName: "star")
        //                starForthImageView.image = UIImage(systemName: "star")
        //                starFifthImageView.image = UIImage(systemName: "star")
        //            }
        //        }
        
    }
    
    //별 이미지 API 통신 Int 값으로 받은 것 표현(for_in 문 사용)
    //    func set(_ star: StarStyle) {
    //        let imageName: String = (star == .filled) ? "star" : "empty"
    //        let imageView = UIImageView(image: UIImage(named: imageName))
    //        stackView.addArangesub(imageView)
    //    }
    //
    
    
    //
    //        func set(_ rating: CGFloat) {
    //            let intRating = rating // rating -> int 값 변환, .5보다 작으면 낮은값, 크면 높은값(반올림하는 코드 찾아서 쓰기)
    //            var views: [UIImageView] = []
    //            for num in 1..<6 {
    //
    //                let imageView = (num <= intRating) ? "채워진 스타" : "빈 스타"
    //                views.append(imageView)
    //                if num <= intRating {
    //                    // 채워진 스타
    //                } else {
    //                    // 빈 스타
    //                }
    //            }
    
    
    
    
    //        // 아래 스위치가 위 반복문으로 되었다. 같은 결과를 도출한다.
    //        switch rating {
    //        case 0..<1:
    //            views = []
    //        case 1..<2:
    //        case 2..<3:
    //        default:
    //
    //        }
    //        stackView.setarranviews(views)
    //    }
    
    
    //자동으로 오버라이드 되고, init 에 호출해줄 필요 없음, MouduleView에서 이미 해줬고, 그 ModuleView를 상속하고 있기 때문!
    override func configureAutolayouts() {
       
        self.addSubview(starHStackView)
        
        starHStackView.top(self.topAnchor, constant: 0)
        starHStackView.leading(self.leadingAnchor, constant: 0)
        starHStackView.trailing(self.trailingAnchor, constant: 0)
        starHStackView.bottom(self.bottomAnchor, constant: 0) 
    }
}


