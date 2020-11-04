//  RatingStarStackView.swift
//  myAppStore
//  Created by 송은비 on 2020/11/02.
//  Copyright © 2020 EB. All rights reserved.
import UIKit


//class를 그대로 가져다가 쓸때는 이니셜라이즈드로도 클래스의 어떤 속성을 이용할 수 있단 것을 알아라
//이니셜라이즈드도 매개변수처럼 사용이 가능함!!!!!
//이 이니셜라이즈드 되어있는 클래스를 가져다 쓰는 어떤 곳에서 이니셜라이즈의 매개변수를 통해 어떤 값을 전달해서 이니셜라이즈드를 각각 상황에 맞게 할수 있단겨...
//
class RatingStarStackView: ModuleView {
    

    enum StarStyle {
        case small
        case middle
        case large
        
        var rawVale: (imageName: String, size: CGFloat, tintColor: UIColor) {
            switch self {
            case .small: return ("star", 8, .lightGray)
            case .middle: return ("star", 12, .gray)
            case .large: return ("star", 14,.lightGray)
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
        //요기에서 위의 상수들에 값을 담아줌(앞에서 이 클래스를 인스턴스하면서 매개변수 식으로 이니셜라이즈 할 값을 전달해준 애를 담아주는겨)
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
        
        //이렇게 나눠주기 전에 이미 AppStoreModel.ResulsEntry는 옵셔널로 해줌
        //들어오는 data가 nil 이 아닐때
        if let data = data {
        let intRating = Int(data.averageUserRating)
            
            //count는 setData 로 넘겨주는 숫자임(이니셜라이즈드로 넘겨받음)
        for num in 1..<(count + 1) {
            //filled는 Bool타입이다 뒤의 조건에 따라 true, false자동책정
            let filled: Bool = (num <= intRating)
            let imageView: UIImageView = starImageView(isFilled: filled)
            subViews.append(imageView)
        }
        
        //들어오는 data가 nil 일때 (리뷰등급 상관없이 채운 작은별 필요할때)
        } else {
            for _ in 1..<(count + 1) {
                let imageView: UIImageView = starImageView(isFilled: true)
                subViews.append(imageView)
            }
        }
        starHStackView.addArrangedSubviews(subViews)
    }
    
     private func starImageView(isFilled: Bool) -> UIImageView {
         
         let imageView: UIImageView = UIImageView()
         var imageName: String = style.rawVale.imageName
         if isFilled == true {
             imageName.append(".fill")
         }
         imageView.image = UIImage(systemName: imageName)!
         imageView.width(style.rawVale.size)
         imageView.height(style.rawVale.size)
         imageView.tintColor = style.rawVale.tintColor
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

