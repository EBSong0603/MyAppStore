//  RequestManager.swift
//  myAppStore
//  Created by 송은비 on 2020/11/11.
//  Copyright © 2020 EB. All rights reserved.

import UIKit

struct Urls {
    //    #if DEBUG //디버그(현재 테스트 중일때의)
    //    static let domain: String = "https://dev.itunes.apple.com"
    //    #else //릴리즈(실제 릴리즈 할때의)
    static let domain: String = "https://itunes.apple.com"
    //    #endif
}

class RequestManager {
    
    enum CustomError: Error {
        case invalidURL
        case noResponse
        case noData
        case error
    }
    
    enum requestError: Error {
        case invalidURL
        case failtedToResponse
        case failedToGetData
        case redirection
        case clientError
        case serverError
        case error
    }
    
    static func request<Model: Decodable>(with type: Model.Type, path: String, param: [String:Any], response: @escaping ((Result<Model?, Error>) -> Void)) {
        
        var urlComponents = URLComponents(string: Urls.domain + path)
        let queryItems = param
        urlComponents?.queryItems = queryItems.map {
            URLQueryItem(name: $0, value: String(describing: $1))
        }
        
        guard let urlComps = urlComponents else { return }
        LogManager.debug("인코딩점\(urlComps)")
        let urlString = String(describing: urlComps)
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, respon, error in
            
            guard let responsed = respon as? HTTPURLResponse else { return }
            
            switch responsed.statusCode {
            case 200..<300:
                guard let printResonse = respon else { return }
                guard let result = printResonse as? HTTPURLResponse else { return }
                print("\(result.statusCode)")
                guard let data = data else { return }
                guard error == nil else { return }
                
                DispatchQueue.main.async {
                    do {
                        let result: Model = try JSONDecoder().decode(Model.self, from: data)
                        response(.success(result))
                    } catch {
                        response(.failure(requestError.invalidURL))
                        print("error: \(error.localizedDescription)")
                    }
                }
            case 300..<400:
                print("300 Error")
                response(.failure(requestError.redirection))
            case 400..<500:
                print("400 Error")
                response(.failure(requestError.clientError))
            case 500..<600:
                print("500 Error")
                response(.failure(requestError.serverError))
            default:
                response(.failure(requestError.error))
            }
        }.resume()
    }
}
