//
//  NSObject+Extension.swift
//  
//
//  Created by Shumpei Nagata on 2021/01/24.
//

import Foundation

extension NSObject: MySwiftExtensionsCompatible {}

public extension MySwiftExtensions where Base: NSObject {
    static var className: String {
        .init(describing: Base.self)
    }
    
    var className: String {
        .init(describing: Base.self)
    }
}
