//
//  UIViewController+Tests.swift
//  
//
//  Created by Shumpei Nagata on 2021/02/12.
//

import XCTest

class UIViewControllerTests: XCTestCase {
    func testInstantiateFromNib() {
        let viewController = XibTestViewController.ex.instantiate()
        XCTAssertFalse(viewController.view.subviews.isEmpty)
    }
}
