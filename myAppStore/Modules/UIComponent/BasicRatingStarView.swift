//  RatingStarStackView.swift
//  myAppStore
//  Created by 송은비 on 2020/11/02.
//  Copyright © 2020 EB. All rights reserved.
import UIKit


//class를 그대로 가져다가 쓸때는 이니셜라이즈드로도 클래스의 어떤 속성을 이용할 수 있단 것을 알아라
//이니셜라이즈드도 매개변수처럼 사용이 가능함!!!!!(init 으로 뭔갈 전달할 수 있단겨)
//이 이니셜라이즈드 되어있는 클래스를 가져다 쓰는 어떤 곳에서 이니셜라이즈의 매개변수를 통해 어떤 값을 전달해서 이니셜라이즈드를 각각 상황에 맞게 할수 있단겨...

class BasicRatingStarView: ModuleView {
    
    enum StarStyle {
        case small
        case middle
        case large
        //각 case(starStyle의 타입)가 가지고 있는 value들을 설정해줌
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
    
    //여기서 타입을 가진 프라이빗 변수를 만들어주고, init에서 사용함
    private let style: StarStyle
    private let count: Int
    
    init(starStyle: StarStyle, count: Int) {
        //요기에서 위의 상수들에 값을 담아줌(앞에서 이 클래스를 인스턴스하면서 매개변수 식으로 이니셜라이즈 할 값을 전달해준 애를 담아주는겨)
        self.style = starStyle
        self.count = count
        //self.은 이 뷰 자체를 말하는거고 이뷰 자체에 있는 style이란 변수에 값 넣어주는 행위이다
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setData(with data: AppStoreModel.ResultsEntry?) {
        //nil일 경우를 위해 옵셔널 처리하고, nil일 경우 일일이 넣어준다(별의 형태 변화해야 하지않고 그냥 이미지로 쓰는경우)
        starHStackView.removeAllSubViews()
        
        var subViews: [UIView] = []
        
        //이렇게 나눠주기 전에 이미 AppStoreModel.ResulsEntry는 옵셔널로 해줌
        //들어오는 data가 nil 이 아닐때(옵셔널 바인딩으로 Nil이 아님을 명시)
        if let data = data {
            let intRating = Int(data.averageUserRating)
            
            //count는 setData 로 넘겨주는 숫자임(이니셜라이즈드로 넘겨받음)
            for num in 1...count {
                //filled는 Bool타입이다 뒤의 조건에 따라 true, false자동책정
                let filled: Bool = (num <= intRating)
                let imageView: UIImageView = setStarImageView(isFilled: filled)
                subViews.append(imageView)
            }
            
            //들어오는 data가 nil 일때 (리뷰등급 상관없이 채운 작은별 필요할때)
        } else {
            for _ in 1...count {
                let imageView: UIImageView = setStarImageView(isFilled: true)
                subViews.append(imageView)
            }
        }
        starHStackView.addArrangedSubviews(subViews)
    }
    
    //Bool 타입은 기본값이 true 임, 그래서 그냥 기본값 true 쓰려면 ==true 해줄필요없이, 그냥 bool {} 하면됨
    //UIImageView 객체를 만들어주는 메서드임 (반환값 객체를 가지고 어딘가에서 쓴다)
    private func setStarImageView(isFilled: Bool) -> UIImageView {
        //여기서 쓰는 style은 이 클래스 변수로지정해준 style임!
        let imageView: UIImageView = UIImageView()
        var imageName: String = style.rawValue.imageName
        if isFilled {
            imageName.append(".fill")
        }
        imageView.image = UIImage(systemName: imageName)!
        imageView.size(style.rawValue.size)
        imageView.tintColor = style.rawValue.tintColor
        //imageView라는 객체 하나를 밷어냄, 이걸 가지고 어디선가 쓸수있게댐
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

