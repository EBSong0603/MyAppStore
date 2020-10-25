//
//  FirstSearchPageTableViewCell.swift
//  myAppStore
//
//  Created by 송은비 on 2020/10/17.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit

class FirstSearchPageTableViewCell: UITableViewCell, Cellable {
    
    static let identifier = "FirstSearchPageTableViewCell"
    
    private let firstView: FirstAppInformationView = {
        let view = FirstAppInformationView()
        return view
    }()
    
    private let secondView: SecondAppInformationView = {
        let view = SecondAppInformationView()
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        confiureAutoLayouts()
    }
    
    required init?(coder: NSCoder) { super.init(coder: coder) }
   
    //setData func 의 매개변수에 데이터값 넣어서 전달해주고(MainViewController로부터)
    //이 setData func 은 또 이 셀이 포함하고 있는 secondView로 데이터 넘겨준다
    
    func setData(with cellData: AppStoreModel.ResultsEntry?) {
        guard let cellData = cellData else {return}
        firstView.setData(with: cellData)
//        let data: [String] = [cellData.screenshotUrls[0], cellData.screenshotUrls[1], cellData.screenshotUrls[2]]
//        secondView.setImageViews(data)
        secondView.setImageViews(cellData.screenshotUrls)
    }
    
    private func confiureAutoLayouts() {
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
