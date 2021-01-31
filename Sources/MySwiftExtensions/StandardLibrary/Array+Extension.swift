//
//  Array+Extension.swift
//  
//
//  Created by Shumpei Nagata on 2021/01/31.
//

public extension Array {
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
