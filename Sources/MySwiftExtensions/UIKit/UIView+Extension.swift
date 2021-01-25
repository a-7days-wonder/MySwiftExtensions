//
//  UIView+Extension.swift
//  
//
//  Created by Shumpei Nagata on 2021/01/25.
//

import UIKit

extension MySwiftExtensions where Base: UIView {
    /**
     baseとviewのanchorにレイアウトの制約をかける
     - Parameters:
        - originAnchor: 制約をかけるbaseのNSLayoutAnchorを指すKeyPath
        - destinationAnchor: 制約をかけるviewのNSLayoutAnchorを指すKeyPath
        - view: 制約をかける対象のUIView
        - constant: 制約の値
     - Returns: かけた制約
     */
    @discardableResult
    public func addConstraint<Anchor: NSLayoutAnchor<Axis>, Axis>(from originAnchor: KeyPath<UIView, Anchor>, to destinationAnchor: KeyPath<UIView, Anchor>, of view: UIView, with constant: CGFloat) -> NSLayoutConstraint {
        view.translatesAutoresizingMaskIntoConstraints = false
        let constraint = base[keyPath: originAnchor].constraint(equalTo: view[keyPath: destinationAnchor], constant: constant)
        base.addConstraint(constraint)
        return constraint
    }
    
    /**
     baseとviewの同じanchorに制約をかける
     - Parameters:
        - anchor: 制約をかけるNSLayoutAnchorを指すKeyPath
        - view: 制約をかける対象のUIView
        - constant: 制約の値
     - Returns: かけた制約
     */
    @discardableResult
    public func addConstraint<Anchor: NSLayoutAnchor<Axis>, Axis>(to anchor: KeyPath<UIView, Anchor>, of view: UIView, with constant: CGFloat) -> NSLayoutConstraint {
        addConstraint(from: anchor, to: anchor, of: view, with: constant)
    }
    
    /**
     baseとviewのdimensionにレイアウトの制約をかける
     - Parameters:
        - originDimension: 制約をかけるbaseのNSLayoutDimensionを指すKeyPath
        - destinationDimension: 制約をかけるviewのNSLayoutDimensionを指すKeyPath
        - view: 制約をかける対象のUIView
        - constant: 制約の値
     - Returns: かけた制約
     */
    @discardableResult
    public func addConstraint(from originDimension: KeyPath<UIView, NSLayoutDimension>, to destinationDimension: KeyPath<UIView, NSLayoutDimension>, of view: UIView, with constant: CGFloat) -> NSLayoutConstraint {
        view.translatesAutoresizingMaskIntoConstraints = false
        let constraint = base[keyPath: originDimension].constraint(equalTo: view[keyPath: destinationDimension], constant: constant)
        base.addConstraint(constraint)
        return constraint
    }
    
    /**
     baseとviewの同じdimensionに制約をかける
     - Parameters:
        - anchor: 制約をかけるNSLayoutDimensionを指すKeyPath
        - view: 制約をかける対象のUIView
        - constant: 制約の値
     - Returns: かけた制約
     */
    @discardableResult
    public func addConstraint(to dimension: KeyPath<UIView, NSLayoutDimension>, of view: UIView, with constant: CGFloat) -> NSLayoutConstraint {
        addConstraint(from: dimension, to: dimension, of: view, with: constant)
    }
    
    /**
     baseのdimensionに制約をかける
     - Parameters:
        - anchor: 制約をかけるNSLayoutDimensionを指すKeyPath
        - constant: 制約の値
     - Returns: かけた制約
     */
    @discardableResult
    public func addConstraint(to dimension: KeyPath<UIView, NSLayoutDimension>, with constant: CGFloat) -> NSLayoutConstraint {
        base.translatesAutoresizingMaskIntoConstraints = false
        let constraint = base[keyPath: dimension].constraint(equalToConstant: constant)
        base.addConstraint(constraint)
        return constraint
    }
    
    /**
     baseにsuperviewがあったら、それに合わせた制約をかける
     */
    public func fillToSuperview() {
        base.superview?.ex.addConstraint(to: \.topAnchor, of: base, with: 0)
        base.superview?.ex.addConstraint(to: \.leftAnchor, of: base, with: 0)
        base.superview?.ex.addConstraint(to: \.rightAnchor, of: base, with: 0)
        base.superview?.ex.addConstraint(to: \.bottomAnchor, of: base, with: 0)
    }
}
