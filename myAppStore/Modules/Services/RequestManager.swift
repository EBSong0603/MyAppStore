//  RequestManager.swift
//  myAppStore
//  Created by 송은비 on 2020/11/11.
//  Copyright © 2020 EB. All rights reserved.

import UIKit

class Log {
    static func debug(_ items: String..., filename: String = #file, function: String = #function, line: Int = #line, separator: String = " ", terminator: String = "\n") {
        #if DEBUG
        let pretty = "\(URL(fileURLWithPath: filename).lastPathComponent)[#\(line)] \(function)\n\t -> "
        let output = items.map { "\($0)" }.joined(separator: separator)
        Swift.print("☀️\(pretty)\(output)", terminator: terminator)
        #else
        Swift.print("Release Mode")
        #endif
    }
}

struct Urls {
    //    #if DEBUG //디버그(현재 테스트 중일때의)
    //    static let domain: String = "https://dev.itunes.apple.com"
    //    #else //릴리즈(실제 릴리즈 할때의)
    static let domain: String = "https://itunes.apple.com"
    //    #endif
    
}

class RequestManager {
    //
    //   static func finalRequest<Model: Decodable>(with type: Model.Type, domain: String, path: String, param: [String:Any], response: @escaping ((Model?, Error?) -> Void)) {
    //
    //        do {
    //            try request(with: type, domain: domain, path: path, param: param, response: { model in
    //                response(model, nil)
    //            })
    //        } catch {
    //            response(nil, error)
    //        }
    //    }
    
    enum CustomError: Error {
        case invalidURL
        case noResponse
        case noData
        case error
    }
    
    static func request<Model: Decodable>(with type: Model.Type, path: String, param: [String:Any], response: @escaping ((Model?) -> Void)) {
        
        var urlComponents = URLComponents(string: Urls.domain + path)
        let queryItems = param
        urlComponents?.queryItems = queryItems.map {
            URLQueryItem(name: $0, value: String(describing: $1))
        }
        
        
        guard let urlComps = urlComponents else { return }
        Log.debug("인코딩점\(urlComps)")
        let urlString = String(describing: urlComps)
        print(urlString)
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, respon, error in
            //내 status code 가 200-300 안에 들어왔을떄만 다음 코드 탈수 있게 제약건 코드
            guard let responsed = respon as? HTTPURLResponse else { return }
            
            switch responsed.statusCode {
            case 200..<300:
                //내 status code가 200-300 안에 들었단거 확인하려고 그냥 쓴 코드
                guard let printResonse = respon else { return }
                guard let result = printResonse as? HTTPURLResponse else { return }
                print("\(result.statusCode)")
                
                //여기서부턴 response가 200-300사이라서 넘어가고 나서 타는 코드
                guard let data = data else { return }
                guard error == nil else { return }
                
                //원래 UIViewController에서 해주던 DispatchQueue.main.async 를 여기서에서 아예 처음 해줌
                //URLSession까지는 비동기이고 메인 쓰레드에서 작용하지 않지만, 여기 do, catch 부터는 메인쓰레드에 올라서 작동되는 코드임
                //그래서 여기서 미리 해주면 뷰컨마다 Dispatch해줄 필요 없음, 테이블뷰 리로드 코드만 써줌 됨
                DispatchQueue.main.async {
                    do {
                        let result: Model = try JSONDecoder().decode(Model.self, from: data)
                        response(result)
                    } catch {
                        response(nil)
                        print("error: \(error.localizedDescription)")
                    }
                }
                
            case 300..<400:
                print("300 Error")
            case 400..<500:
                print("400 Error")
            case 500..<600:
                print("500 Error")
                response(nil)
            default:
                response(nil)
            }
            
            
        }.resume()
        
    }
    
    
    
    //No Error Handing, No throws ==================================================//
    
    static func otherRequest<Model: Decodable>(with model: Model.Type, domain: String, path: String, param: [String:Any], response: @escaping ((Model?)) -> Void) {
        
        var urlComponents = URLComponents(string: domain + path)
        let queryItems = param
        
        urlComponents?.queryItems = queryItems.map {
            URLQueryItem(name: $0, value: String(describing: $1))
        }
        
        guard let urlComps = urlComponents else {return}
        let urlString = "\(urlComps)"
        guard let target = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
        
        guard let url = URL(string: target) else {return}
        URLSession.shared.dataTask(with: url) { data, respon, error in
            guard let responsed = respon as? HTTPURLResponse else {return}
            guard 200..<300 ~= responsed.statusCode else {
                print("Status code was : \(responsed.statusCode)")
                return
            }
            
            guard let data = data else {return}
            guard  error == nil else {return}
            
            DispatchQueue.main.async {
                do {
                    let result: Model = try JSONDecoder().decode(Model.self, from: data)
                    response(result)
                } catch {
                    response(nil)
                    print("error : \(error.localizedDescription)")
                }
            }
        }.resume()
    }
}
