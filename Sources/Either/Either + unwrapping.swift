//
//  Either + unwrapping.swift
//  
//
//  Created by The Northstar✨ System on 2023-08-08.
//

import Foundation



prefix operator *



public extension Either {
    
    /// If the held value is the `Left` type, then it's returned. Otherwise, `nil` is returned
    var left: Left? {
        switch self {
        case .left(let left):
            return left
            
        case .right(_):
            return nil
        }
    }
    
    
    /// If the held value is the `Right` type, then it's returned. Otherwise, `nil` is returned
    var right: Right? {
        switch self {
        case .right(let right):
            return right
            
        case .left(_):
            return nil
        }
    }
}



public extension Either where Left == Right {
    
    /// Unwraps whatever value this has, left or right
    ///
    /// ```swift
    /// var either = Either<String, String>.left("Hello")
    /// print(*either) // Prints "Hello"
    ///
    /// either = .right("World")
    /// print(*either) // Prints "World"
    /// ```
    ///
    /// This is only available when the `Left` type is the same as the `Right` type
    @inline(__always)
    static prefix func * (_ rhs: Self) -> Value {
        rhs.value
    }
    
    
    /// Unwraps whatever value this has, left or right
    ///
    /// ```swift
    /// var either = Either<String, String>.left("Hello")
    /// print(either.value) // Prints "Hello"
    ///
    /// either = .right("World")
    /// print(either.value) // Prints "World"
    /// ```
    ///
    /// This is only available when the `Left` type is the same as the `Right` type
    var value: Value {
        switch self {
        case .left(let left):
            return left
            
        case .right(let right):
            return right
        }
    }
    
    
    
    /// The type of value this contains
    ///
    /// This is only available when the `Left` type is the same as the `Right` type
    typealias Value = Left
}
