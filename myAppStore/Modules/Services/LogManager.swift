//  LogManager.swift
//  myAppStore
//  Created by 송은비 on 2020/11/20.
//  Copyright © 2020 EB. All rights reserved.

import Foundation

class LogManager {
    
    static func debug(_ itmes: String..., filename: String = #file, function: String = #function, line: Int = #line, separator: String = " ", terminator: String = "\n") {
        #if DEBUG
        let pretty = "\(URL(fileURLWithPath: filename).lastPathComponent)[#\(line)] \(function)\n\t -> "
        let output = itmes.map { "\($0)" }.joined(separator: separator)
        Swift.print("☀️\(pretty)\(output)", terminator: terminator)
        #else
        Swift.print("Release Mode")
        #endif
    }
}
