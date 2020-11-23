//  DetailThirdCapturedImageView.swift
//  myAppStore
//  Created by 송은비 on 2020/10/19.
//  Copyright © 2020 EB. All rights reserved.
import UIKit

class DetailScreenShotsView: ModuleView {
    
    var screenshotData: [String] = []
    
    private let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(ScreenShotsCollectionViewCell.self,
                    forCellWithReuseIdentifier: ScreenShotsCollectionViewCell.identifier)
        layout.scrollDirection = .horizontal
        return cv
    }()
    
    private let previewTitleView: PreviewTitleView = PreviewTitleView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
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
        collectionView.backgroundColor = .white
    }
    
    override func configureAutolayouts() {
  
        self.addSubview(collectionView)
        self.addSubview(previewTitleView)
        previewTitleView.top(self.topAnchor)
        previewTitleView.leading(self.leadingAnchor, constant: 16)
        previewTitleView.trailing(self.trailingAnchor)
        
        collectionView.top(previewTitleView.bottomAnchor, constant: 8)
        collectionView.leading(self.leadingAnchor)
        collectionView.trailing(self.trailingAnchor)
        collectionView.bottom(self.bottomAnchor)
    }
    
    func setData(with urls: [String]) {
        screenshotData = urls
    }
}

extension DetailScreenShotsView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 230, height: 400)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return screenshotData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)
        -> UICollectionViewCell {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScreenShotsCollectionViewCell.identifier,
                                                          for: indexPath) as! ScreenShotsCollectionViewCell
            cell.backgroundColor = .white
            cell.setData(with: screenshotData[indexPath.row])
            return cell
    }
}
