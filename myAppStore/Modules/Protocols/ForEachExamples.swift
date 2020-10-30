//  ForEachExamples.swift
//  myAppStore
//  Created by 송은비 on 2020/10/28.
//  Copyright © 2020 EB. All rights reserved.

import Foundation
//
//for index in models.indices {
//
//  }
//  for index in 0..<models.count - 1  {
//
//  }
//  for (index, model) in models.enumerated() {
//
//  }

//아래 두개는 같은 얘기임
//  models.forEach { $0.artistName }
//  models.forEach { [weak self] model in
//      if model.artistName.isEmpty {
//
//      }
//  }
//




//위의 for문과 아래의 forEach 2가지는 같은 의미
//let array = [1, 2, 3]
//
//for element in array { print(element) } // 1 2 3
//
//array.forEach { print($0) } // 1 2 3
//
//array.forEach { element in
//    print(element)
//}
