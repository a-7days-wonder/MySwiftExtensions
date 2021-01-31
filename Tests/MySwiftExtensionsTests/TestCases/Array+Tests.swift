//
//  Array+Tests.swift
//  
//
//  Created by Shumpei Nagata on 2021/01/31.
//

import XCTest

final class ArrayTests: XCTestCase {
    func testSafeSubscript() {
        let array = ["foo", "bar", "baz"]
        XCTAssertEqual(array[0], array[safe: 0])
        XCTAssertNil(array[safe: 1000])
    }
    
    func testSort() {
        var array = ["React Native", "Flutter", "Xamarin"]
        let arraySortedByLexicalOrder = array.ex.sorted(by: \.self, order: .ascending)
        array.sort(by: \.self, order: .ascending)
        XCTAssertEqual(array, arraySortedByLexicalOrder)
        array.sort(by: \.self, order: .descending)
        XCTAssertEqual(array, arraySortedByLexicalOrder.reversed())    }
}
