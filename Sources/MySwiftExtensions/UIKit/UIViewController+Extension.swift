//
//  UIViewController+Extension.swift
//  
//
//  Created by Shumpei Nagata on 2021/02/12.
//

import UIKit

extension MySwiftExtensions where Base: UIViewController {
    /**
     UIViewControllerをXibから読み込む
     - Returns: Xibから生成したUIViewController
     */
    public static func instantiate() -> Base {
        .init(nibName: className, bundle: .init(for: Base.self))
    }
}
