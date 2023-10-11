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
    static var live: Value { get set }
    
    /// Value for tests. Set to `.live` by default.
    static var test: Value { get set }
    
    /// Value for SwiftUI Previews. Set to `.live` by default.
    static var preview: Value { get set }
}

public extension InjectionKey {
    static var test: Value { Self.live }
    static var preview: Value { Self.live }
}
