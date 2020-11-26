//  DetailThirdCapturedImageView.swift
//  myAppStore
//  Created by 송은비 on 2020/10/19.
//  Copyright © 2020 EB. All rights reserved.

import UIKit

class ScreenShotsCollectionView: ModuleView {
    
    var screenshotData: [String] = []
    
    private let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(ScreenShotsCollectionViewCell.self,
                    forCellWithReuseIdentifier: ScreenShotsCollectionViewCell.identifier)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8
        return cv
    }()
    
    private let phoneImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.setImageViewStyle(UIImage(systemName: "iphone")!, tintColor: UIColor(named: "ColorSetGray")!, contentMode: .scaleAspectFill)
        imageView.size(13)
        return imageView
    }()
    private let phoneLabel: BasicComponentLabel = {
        let label = BasicComponentLabel(labelStyle: .system15)
        label.setStyle(title: "iPhone", color: UIColor(named: "ColorSetGray")!)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        self.heightAnchor.constraint(equalToConstant: 460).isActive = true
        prepareCollectionView()
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func prepareCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .systemBackground

//        collectionView.isPagingEnabled = true
        
        
    }
    
    override func configureAutolayouts() {
        
        self.addSubview(collectionView)
        self.addSubview(phoneImageView)
        self.addSubview(phoneLabel)
        collectionView.top(self.topAnchor)
        collectionView.leading(self.leadingAnchor)
        collectionView.trailing(self.trailingAnchor)

        phoneImageView.top(collectionView.bottomAnchor)
        phoneImageView.leading(self.leadingAnchor, constant: 16)

        phoneImageView.bottom(self.bottomAnchor)
        phoneLabel.leading(phoneImageView.trailingAnchor, constant: 8)
        phoneLabel.centerY(phoneImageView.centerYAnchor)
        phoneLabel.trailing(self.trailingAnchor)
    }
    
    func setData(with data: AppStoreModel.ResultsEntry) {
        screenshotData = data.screenshotUrls
        
    }
}

extension ScreenShotsCollectionView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 230, height: 400)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 8, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return screenshotData.count
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)
    -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScreenShotsCollectionViewCell.identifier,
                                                      for: indexPath) as! ScreenShotsCollectionViewCell
        cell.backgroundColor = .systemBackground
        cell.setData(with: screenshotData[indexPath.row])
        return cell
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        guard let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {return}
    
    
        let cellWidthIncludeSpacing = 500 + layout.minimumLineSpacing
        
        let estimatedIndex = scrollView.contentOffset.x / cellWidthIncludeSpacing
        let index: Int
        if velocity.x > 0 {
            index = Int(ceil(estimatedIndex))
            
        } else if velocity.x < 0 {
            index = Int(floor(estimatedIndex))
        } else {
            index = Int(round(estimatedIndex))
        }
        targetContentOffset.pointee = CGPoint(x: CGFloat(index) * cellWidthIncludeSpacing, y: 0)
    }
}
