public struct MySwiftExtensions<Base> {
    let base: Base
    
    public init(_ base: Base) {
        self.base = base
    }
}

public protocol MySwiftExtensionsCompatible {
    associatedtype MySwiftExtensionsBase
    
    static var ex: MySwiftExtensions<MySwiftExtensionsBase>.Type { get }
    var ex: MySwiftExtensions<MySwiftExtensionsBase> { get }
}

public extension MySwiftExtensionsCompatible {
    static var ex: MySwiftExtensions<Self>.Type { MySwiftExtensions<Self>.self }
    var ex: MySwiftExtensions<Self> { .init(self) }
}
