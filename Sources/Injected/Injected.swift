// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

@propertyWrapper
public struct Injected<T> {
    private let keyPath: WritableKeyPath<InjectedValues, T>
    
    public var wrappedValue: T {
        get { InjectedValues[keyPath] }
        set { InjectedValues[keyPath] = newValue }
    }
    
    public init(keyPath: WritableKeyPath<InjectedValues, T>) {
        self.keyPath = keyPath
    }
}
