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
    
    /**
     Arrayを指定したプロパティ・順序でソートする
     
     - Parameters:
        - keyPath: ソートの対象となるプロパティを示すKeyPath
        - order: ソート順(昇順・降順)
     */
    mutating func sort<T: Comparable>(by keyPath: KeyPath<Element, T>, order: MySwiftExtensions<Self>.SortOrder<T>) {
        sort { order.method($0[keyPath: keyPath], $1[keyPath: keyPath]) }
    }
}
