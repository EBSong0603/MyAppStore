//  FirstSearchPageTableViewCell.swift
//  myAppStore
//  Created by 송은비 on 2020/10/17.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class FirstSearchPageTableViewCell: BaseTableViewCell {
    
    static let identifier: String = "FirstSearchPageTableViewCell"
 
//    private let firstView: FirstAppInformationView = {
//        let view = FirstAppInformationView()
//        return view
//    }()
    
    private let firstView = FirstAppInformationView()
    
//    private let secondView: SecondAppInformationView = {
//        let view = SecondAppInformationView()
//        return view
//    }()
//
    private let secondView = SecondAppInformationView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //setData func 의 매개변수에 데이터값 넣어서 전달해주고(MainViewController로부터)
    //이 setData func 은 또 이 셀이 포함하고 있는 secondView로 데이터 넘겨준다
    func setData(with cellData: AppStoreModel.ResultsEntry?) {
        guard let cellData = cellData else {return}
        firstView.setData(with: cellData)
//        let data: [String] = [cellData.screenshotUrls[0], cellData.screenshotUrls[1], cellData.screenshotUrls[2]]
//        secondView.setImageViews(data)
        
        
        
        
        
        let urls: [String] = filteredImageUrls(with: cellData)
        secondView.setImageViews(urls)
        //위와 아래는 같은것
        //일급객체로서의 함수란? -> 반환값을 가지고 있는 함수는 상수나 변수에 담지 않고 반환값을 그대로 쓸수 있습니다!
        //아래처럼! 한줄로 쓸수 있다! (그 함수의 반환값을 그냥 바로 대입시키는 식으로 쓸수 있는겨)
        secondView.setImageViews(filteredImageUrls(with: cellData))
    }
    
    //이미지 3장만 뽑아오기! function -> forEach로 바꿔보기
    private func filteredImageUrls(with cellData: AppStoreModel.ResultsEntry) -> [String] {
        let urlArray: [String] = cellData.screenshotUrls
        var urls: [String] = []
        for url in urlArray {
            if urls.count > 2 {return urls} //urls의 갯수가 3개가 넘어가는 순간 그냥 return 시킨다, urls로
            urls.append(url)
        }
        return urls
    }
    
    
    
    
    
    
    
    override func configureAutolayouts() {
        contentView.addSubview(firstView)
        contentView.addSubview(secondView)
        
        firstView.top(contentView.topAnchor, constant: 4)
        firstView.leading(contentView.leadingAnchor)
        firstView.trailing(contentView.trailingAnchor)
 
        secondView.top(firstView.bottomAnchor, constant: 4)
        secondView.leading(firstView.leadingAnchor)
        secondView.trailing(firstView.trailingAnchor)
        secondView.bottom(contentView.bottomAnchor, constant: -4)
    }
}
