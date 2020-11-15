//
//  WhatsNewDescriptionView.swift
//  myAppStore
//
//  Created by 송은비 on 2020/11/12.
//  Copyright © 2020 EB. All rights reserved.
//

import UIKit

class WhatsNewDescriptionView: ModuleView {
    
    
    private let whatsNewDescriptionLabel: UILabel = {
       let label = UILabel()
        label.setStyle("기능이 향상됐어욤!", textColor: .black, font: UIFont.systemFont(ofSize: 12))
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(with data: AppStoreModel.ResultsEntry) {
        whatsNewDescriptionLabel.text = data.releaseNotes
        
        
    }
    
    override func configureAutolayouts() {
        self.addSubview(whatsNewDescriptionLabel)
        whatsNewDescriptionLabel.edges(self, vConstant: 0, hConstant: 16)
    }
}
