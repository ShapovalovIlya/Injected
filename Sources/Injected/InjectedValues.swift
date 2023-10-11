//
//  InjectedValues.swift
//
//
//  Created by Илья Шаповалов on 08.10.2023.
//

import Foundation

public struct InjectedValues {
    /// This is only used as an accessor to the computed properties within extensions of `InjectedValues`.
    private static var current = Self()
    
    /// A static subscript for updating the `currentValue` of `InjectionKey` instances.
    public static subscript<K>(key: K.Type) -> K.Value where K:InjectionKey {
        get {
            switch Context.init() {
            case .live: return key.live
            case .preview: return key.preview
            case .test: return key.test
            }
        }
        set {
            switch Context.init() {
            case .live: key.live = newValue
            case .preview: key.preview = newValue
            case .test: key.test = newValue
            }
        }
    }
    
    /// A static subscript accessor for updating and references dependencies directly.
    public static subscript<T>(_ keyPath: WritableKeyPath<InjectedValues, T>) -> T {
        get { current[keyPath: keyPath] }
        set { current[keyPath: keyPath] = newValue }
    }
}

extension InjectedValues {
    enum Context {
        case live
        case preview
        case test
        
        init() {
            if ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil {
                self = .test
                return
            }
            if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" {
                self = .preview
                return
            }
            self = .live
        }
    }
}
