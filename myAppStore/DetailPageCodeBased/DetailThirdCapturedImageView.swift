//
//  DetailThirdCapturedImageView.swift
//  myAppStore
//
//  Created by 송은비 on 2020/10/19.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit

class DetailThirdCapturedImageView: UIView {
    

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
    
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        self.backgroundColor = .white
        self.heightAnchor.constraint(equalToConstant: 200).isActive = true
        self.addSubview(collectionView)
        collectionView.backgroundColor = .white
        
        
        NSLayoutConstraint.activate([
        
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)

        ])
       
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    
    
    
    
    
    
}

extension DetailThirdCapturedImageView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 200)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CapturedImageCollectionViewCell.identifier, for: indexPath) as! CapturedImageCollectionViewCell
        cell.backgroundColor = .white
        
        return cell
    }
    
    
}
