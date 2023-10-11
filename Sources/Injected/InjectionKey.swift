//
//  InjectionKey.swift
//
//
//  Created by Илья Шаповалов on 08.10.2023.
//

import Foundation

public protocol InjectionKey {
    /// The associated type representing the type of the dependency injection key's value.
    associatedtype Value = Self
    
    /// The default value for the dependency injection key. 
    static var liveValue: Value { get set }
    
    /// Value for tests. Set to `.live` by default.
    static var testValue: Value { get set }
    
    /// Value for SwiftUI Previews. Set to `.live` by default.
    static var previewValue: Value { get set }
}

public extension InjectionKey {
    static var testValue: Value { Self.liveValue }
    static var previewValue: Value { Self.liveValue }
}
