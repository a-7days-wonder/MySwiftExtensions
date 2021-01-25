//
//  UIView+Tests.swift
//  
//
//  Created by Shumpei Nagata on 2021/01/25.
//

import XCTest

class UIViewTests: XCTestCase {
    func testAnchorConstraint() {
        let parentView = UIView(frame: .init(origin: .zero, size: .init(width: 100, height: 100)))
        let childView = UIView(frame: .init(origin: .zero, size: .init(width: 50, height: 50)))
        parentView.addSubview(childView)
        
        let constant: CGFloat = 20
        parentView.ex.addConstraint(to: \.topAnchor, of: childView, with: constant)
        parentView.ex.addConstraint(from: \.leftAnchor, to: \.rightAnchor, of: childView, with: constant)
        parentView.layoutIfNeeded()

        XCTAssertEqual(parentView.frame.minY - childView.frame.minY, constant)
        XCTAssertEqual(parentView.frame.minX - childView.frame.maxX, constant)
    }
    
    func testFillToSuperview() {
        let parentView = UIView(frame: .init(origin: .zero, size: .init(width: 100, height: 100)))
        let childView = UIView(frame: .init(origin: .zero, size: .init(width: 50, height: 50)))
        parentView.addSubview(childView)
        childView.ex.fillToSuperview()
        parentView.layoutIfNeeded()
        XCTAssertEqual(parentView.frame, childView.bounds)
    }
    
    func testDimensionConstraint() {
        let parentView = UIView(frame: .init(origin: .zero, size: .init(width: 100, height: 120)))
        let childView = UIView(frame: .init(origin: .zero, size: .init(width: 50, height: 50)))
        parentView.addSubview(childView)

        let constant: CGFloat = 20
        parentView.ex.addConstraint(to: \.heightAnchor, of: childView, with: constant)
        parentView.ex.addConstraint(from: \.widthAnchor, to: \.heightAnchor, of: parentView, with: 0)
        parentView.layoutIfNeeded()
        XCTAssertEqual(parentView.frame.height, childView.frame.height + constant)
        XCTAssertEqual(parentView.frame.width, parentView.frame.height)
    }
}
