//  FirstSearchPageTableViewCell.swift
//  myAppStore
//  Created by 송은비 on 2020/10/17.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class SearchPageTableViewCell: BaseTableViewCell, Cellable {

    static var identifier: String = SearchPageTableViewCell.identifierString
    private let firstView = SearchPageAppInformationView()
    private let secondView = SearchPageAppScreenShotsView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(with cellData: AppStoreModel.ResultsEntry?) {
        
        guard let cellData = cellData else {return}
        firstView.setData(with: cellData)
        let urls: [String] = filteredScreenShotsUrls(with: cellData)
        secondView.setImageViews(urls)
        //위와 아래는 같은것
        //일급객체로서의 함수란? -> 반환값을 가지고 있는 함수는 상수나 변수에 담지 않고 반환값을 그대로 쓸수 있습니다!
        //반환값이 있어야지만 객체로 쓸수 있다! 있어야지만!!
        //아래처럼! 한줄로 쓸수 있다! (그 함수의 반환값을 그냥 바로 대입시키는 식으로 쓸수 있는겨)
        secondView.setImageViews(filteredScreenShotsUrls(with: cellData))
    }
    //이미지 3장만 뽑아오기! function -> forEach로 바꿔보기
    private func filteredScreenShotsUrls(with cellData: AppStoreModel.ResultsEntry) -> [String] {
        let urlArray: [String] = cellData.screenshotUrls
        var urls: [String] = []
            urlArray.forEach { url1 in
                if urls.count > 2 {return}
                urls.append(url1)
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
