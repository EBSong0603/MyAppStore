//  AppStoreViewModel.swift
//  myAppStore
//  Created by 송은비 on 2020/11/04.
//  Copyright © 2020 EB. All rights reserved.

import Foundation

class AppStoreViewModel {
    
    var isChanged: ((Bool) -> Void)?
    
    struct OutPut {
        var models: [AppStoreModel.ResultsEntry] = []
    }
    
    struct InPut {
        var selectedModel: AppStoreModel.ResultsEntry?
    }
    
    var outPut: OutPut = OutPut()
    var inPut: InPut = InPut()
    
    
    func requestData(term: String) {
        // Full API 주소: "https://itunes.apple.com/search?entity=software&country=KR&term=cash"

        let path: String = "/search?"
        let param: [String:Any] = ["entity":"software", "country":"KR", "term":"\(term)"]
  
        RequestManager.request(with: AppStoreModel.self, path: path, param: param) { [weak self] model  in
            guard let self = self, let model = model else {return}
            
            self.outPut.models = model.results
            self.isChanged?(true)
        }
    }
    
    func reset() {
        outPut.models = []
        self.isChanged?(true)
    }
}
