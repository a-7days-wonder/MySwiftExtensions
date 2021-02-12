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
    public func addConstraint<Anchor: NSLayoutAnchor<Axis>, Axis>(
        from originAnchor: KeyPath<UIView, Anchor>,
        to destinationAnchor: KeyPath<UIView, Anchor>,
        of view: UIView,
        with constant: CGFloat = 0.0
    ) -> NSLayoutConstraint {
        view.translatesAutoresizingMaskIntoConstraints = false
        return {
            NSLayoutConstraint.activate([$0])
            return $0
        }(base[keyPath: originAnchor].constraint(equalTo: view[keyPath: destinationAnchor], constant: constant))
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
    public func addConstraint<Anchor: NSLayoutAnchor<Axis>, Axis>(
        to anchor: KeyPath<UIView, Anchor>,
        of view: UIView,
        with constant: CGFloat = 0.0
    ) -> NSLayoutConstraint {
        addConstraint(from: anchor, to: anchor, of: view, with: constant)
    }
    
    /**
     baseとviewのdimensionにレイアウトの制約をかける
     - Parameters:
        - originDimension: 制約をかけるbaseのNSLayoutDimensionを指すKeyPath
        - destinationDimension: 制約をかけるviewのNSLayoutDimensionを指すKeyPath
        - view: 制約をかける対象のUIView
        - multiplier: 制約の倍率
        - constant: 制約の値
     - Returns: かけた制約
     */
    @discardableResult
    public func addConstraint(
        from originDimension: KeyPath<UIView, NSLayoutDimension>,
        to destinationDimension: KeyPath<UIView, NSLayoutDimension>,
        of view: UIView,
        by multiplier: CGFloat = 1.0,
        with constant: CGFloat = 0.0
    ) -> NSLayoutConstraint {
        view.translatesAutoresizingMaskIntoConstraints = false
        return {
            NSLayoutConstraint.activate([$0])
            return $0
        }(base[keyPath: originDimension].constraint(equalTo: view[keyPath: destinationDimension], multiplier: multiplier, constant: constant))
    }
    
    /**
     baseとviewの同じdimensionに制約をかける
     - Parameters:
        - dimension: 制約をかけるNSLayoutDimensionを指すKeyPath
        - view: 制約をかける対象のUIView
        - multiplier: 制約の倍率
        - constant: 制約の値
     - Returns: かけた制約
     */
    @discardableResult
    public func addConstraint(
        to dimension: KeyPath<UIView, NSLayoutDimension>,
        of view: UIView,
        by multiplier: CGFloat = 1.0,
        with constant: CGFloat = 0.0
    ) -> NSLayoutConstraint {
        addConstraint(from: dimension, to: dimension, of: view, by: multiplier, with: constant)
    }
    
    /**
     baseのdimensionに制約をかける
     - Parameters:
        - originDimension: 制約をかけるbaseのNSLayoutDimensionを指すKeyPath
        - destinationDimension: 制約をかけるviewのNSLayoutDimensionを指すKeyPath
        - multiplier: 制約の倍率
        - constant: 制約の値
     - Returns: かけた制約
     */
    @discardableResult
    public func addConstraint(
        from originDimension: KeyPath<UIView, NSLayoutDimension>,
        to destinationDimension: KeyPath<UIView, NSLayoutDimension>,
        by multiplier: CGFloat = 1.0,
        with constant: CGFloat = 0.0
    ) -> NSLayoutConstraint {
        addConstraint(from: originDimension, to: destinationDimension, of: base, by: multiplier, with: constant)
    }
    
    /**
     baseのdimensionに制約をかける
     - Parameters:
        - dimension: 制約をかけるNSLayoutDimensionを指すKeyPath
        - constant: 制約の値
     - Returns: かけた制約
     */
    @discardableResult
    public func addConstraint(
        to dimension: KeyPath<UIView, NSLayoutDimension>,
        with constant: CGFloat
    ) -> NSLayoutConstraint {
        base.translatesAutoresizingMaskIntoConstraints = false
        return {
            NSLayoutConstraint.activate([$0])
            return $0
        }(base[keyPath: dimension].constraint(equalToConstant: constant))
    }
    
    /**
     baseにsuperviewがあったら、それに合わせた制約をかける
     */
    public func fillToSuperview() {
        base.superview?.ex.addConstraint(to: \.topAnchor, of: base)
        base.superview?.ex.addConstraint(to: \.leftAnchor, of: base)
        base.superview?.ex.addConstraint(to: \.rightAnchor, of: base)
        base.superview?.ex.addConstraint(to: \.bottomAnchor, of: base)
    }
    
    /**
     XibからUIViewを生成する
     - Returns: Xibから生成したUIView
     */
    public func loadViewFromNib() -> UIView {
        UINib(nibName: className, bundle: .init(for: Base.self))
            .instantiate(withOwner: base, options: nil)
            .first as! UIView
    }
    
    /**
     XibからViewを読み込み、addSubviewする
     - Returns: Xibから読み込み、addSubviewされたUIView
     */
    @discardableResult
    public func addSubviewFromNib() -> UIView {
        let view = loadViewFromNib()
        base.addSubview(view)
        view.ex.fillToSuperview()
        return view
    }
}
