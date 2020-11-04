//
//  AppStoreViewModel.swift
//  myAppStore
//
//  Created by 송은비 on 2020/11/04.
//  Copyright © 2020 EB. All rights reserved.
//

import Foundation

class AppStoreViewModel {
    
    var isChanged: ((Bool) -> Void)?
    
    var models: [AppStoreModel.ResultsEntry] = []
    
    func requestData(term: String, responseData:  (([AppStoreModel.ResultsEntry]) -> Void)? = nil) {
        let urlSting = "https://itunes.apple.com/search?entity=software&country=KR&term=\(term)"
        guard let target = urlSting.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
        guard let url = URL(string: target) else {return}
        URLSession.shared.dataTask(with: url,
                                   completionHandler: {data, reponse, error in
                                    guard let data = data, error == nil else {
                                        print("Something Wrong")
                                        
                                        return
                                    }
                                    
                                   
                                    
                                    do {
                                        let result: AppStoreModel = try JSONDecoder().decode(AppStoreModel.self, from: data)
                                        
                                        responseData?(result.results)
                                        self.models = result.results
                                        self.isChanged?(true)
                                    } catch {
                                        print("error: \(error)")
                                    }
        }).resume()
    }
    
    func reset() {
        models = []
        isChanged?(true)
    }
}
