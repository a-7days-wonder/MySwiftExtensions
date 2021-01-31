//
//  Sequence+Tests.swift
//  
//
//  Created by Shumpei Nagata on 2021/01/31.
//

import XCTest

final class SequenceTests: XCTestCase {
    func testSort() {
        let array = ["Objective-C", "Swift", "Java", "Kotlin"]
        let shuffledArray = array.shuffled()
        let arraySortedByCount = array.sorted { $0.count < $1.count }
        
        XCTAssertEqual(array.sorted(), shuffledArray.ex.sorted(by: \.self, order: .ascending))
        XCTAssertEqual(array.sorted().reversed(), shuffledArray.ex.sorted(by: \.self, order: .descending))
        
        XCTAssertEqual(arraySortedByCount, array.ex.sorted(by: \.count, order: .ascending))
        XCTAssertEqual(arraySortedByCount.reversed(), array.ex.sorted(by: \.count, order: .descending))
    }
}
