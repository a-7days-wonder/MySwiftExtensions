//
//  Sequence+Extension.swift
//  
//
//  Created by Shumpei Nagata on 2021/01/31.
//

public extension Sequence {
    static var ex: MySwiftExtensions<Self>.Type { MySwiftExtensions<Self>.self }
    var ex: MySwiftExtensions<Self> { .init(self) }
}

public extension MySwiftExtensions where Base: Sequence {
    /// ソート順
    enum SortOrder<T: Comparable> {
        /// 昇順
        case ascending
        /// 降順
        case descending
        
        /// ソートの条件を示すクロージャ
        internal var method: (T, T) -> Bool {
            switch self {
            case .ascending: return { $0 < $1 }
            case .descending: return { $0 > $1 }
            }
        }
    }
    
    /**
     指定したプロパティ・順序でソートしたSequenceを返す
     
     - Parameters:
        - keyPath: ソートの対象となるプロパティを示すKeyPath
        - order: ソート順(昇順・降順)
     - Returns: 指定した条件でソートされたSequence
     */
    func sorted<T: Comparable>(by keyPath: KeyPath<Base.Element, T>, order: SortOrder<T>) -> [Base.Element] {
        base.sorted { order.method($0[keyPath: keyPath], $1[keyPath: keyPath]) }
    }
}
