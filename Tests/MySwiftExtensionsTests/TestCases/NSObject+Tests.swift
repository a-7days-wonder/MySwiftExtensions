//
//  NSObject+Tests.swift
//  
//
//  Created by Shumpei Nagata on 2021/01/24.
//

import XCTest

class NSObjectTests: XCTestCase {
    class TestClass: NSObject {}
    
    func testInstanceClassName() {
        XCTAssertEqual(TestClass().ex.className, "TestClass")
    }
    
    func testStaticClassName() {
        XCTAssertEqual(TestClass.ex.className, "TestClass")
    }
}
