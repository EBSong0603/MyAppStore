//
//  DetailThirdCapturedImageView.swift
//  myAppStore
//
//  Created by 송은비 on 2020/10/19.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit

class DetailThirdCapturedImageView: UIView {

    var screenshotData: [String] = []
    private let collectionView: UICollectionView = {
        
       let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CapturedImageCollectionViewCell.self, forCellWithReuseIdentifier: CapturedImageCollectionViewCell.identifier)
        layout.scrollDirection = .horizontal
        return cv
    }()
     
    override init(frame: CGRect) {
        super.init(frame: frame)
          
        self.heightAnchor.constraint(equalToConstant: 270).isActive = true
        collectionView.delegate = self
        collectionView.dataSource = self
  
        self.backgroundColor = .white
        self.addSubview(collectionView)
        collectionView.backgroundColor = .white
//        collectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
     
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setData(with urls: [String]) {
      screenshotData = urls
    }
}

extension DetailThirdCapturedImageView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 250)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(screenshotData.count)
        return screenshotData.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CapturedImageCollectionViewCell.identifier, for: indexPath) as! CapturedImageCollectionViewCell
        cell.backgroundColor = .white
        cell.setData(with: screenshotData[indexPath.row])
        return cell
    }
}
