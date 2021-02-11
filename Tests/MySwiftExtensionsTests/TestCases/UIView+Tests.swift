//
//  UIView+Tests.swift
//  
//
//  Created by Shumpei Nagata on 2021/01/25.
//

import XCTest

class UIViewTests: XCTestCase {
    func testKeyPathConstraint() {
        let parentView = UIView(frame: .init(origin: .zero, size: .init(width: 100, height: 100)))
        let childView = UIView(frame: .init(origin: .zero, size: .init(width: 50, height: 50)))
        parentView.addSubview(childView)
        
        XCTAssertNotEqual(parentView.frame, childView.frame)
        
        parentView.ex.addConstraint(to: \.widthAnchor, with: 200)
        parentView.ex.addConstraint(from: \.heightAnchor, to: \.widthAnchor, with: 20)
        
        childView.ex.addConstraint(from: \.topAnchor, to: \.bottomAnchor, of: parentView, with: 20)
        childView.ex.addConstraint(to: \.leftAnchor, of: parentView, with: 20)
        parentView.ex.addConstraint(to: \.rightAnchor, of: childView, with: 20)
        childView.ex.addConstraint(to: \.heightAnchor, with: 100)
        
        parentView.layoutIfNeeded()
        
        XCTAssertEqual(parentView.frame.size, .init(width: 200, height: 220))
        XCTAssertEqual(childView.frame.size, .init(width: 160, height: 100))
        XCTAssertEqual(childView.frame.minY - parentView.bounds.maxY, 20)
    }
    
    func testFillToSuperview() {
        let parentView = UIView(frame: .init(origin: .zero, size: .init(width: 100, height: 100)))
        let childView = UIView(frame: .init(origin: .zero, size: .init(width: 50, height: 50)))
        parentView.addSubview(childView)
        
        parentView.ex.addConstraint(to: \.widthAnchor, with: 200)
        parentView.ex.addConstraint(from: \.heightAnchor, to: \.widthAnchor)
        childView.ex.fillToSuperview()
        parentView.layoutIfNeeded()
        
        XCTAssertEqual(parentView.frame.size, .init(width: 200, height: 200))
        XCTAssertEqual(parentView.bounds.size, childView.frame.size)
    }
}
