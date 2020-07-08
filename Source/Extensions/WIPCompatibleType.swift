public struct WIPContainer<T> {
    public let type: T
    public init(_ type: T) {
        self.type = type
    }
}

public protocol WIPCompatibleReferenceType: AnyObject { }

public protocol WIPCompatibleValueType { }

extension WIPCompatibleReferenceType {
    public var wip: WIPContainer<Self> {
        get { return WIPContainer(self) }
        set { }
    }
}

extension WIPCompatibleValueType {
    public var wip: WIPContainer<Self> {
        get { return WIPContainer(self) }
        set { }
    }
}

