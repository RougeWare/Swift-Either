//
//  Either + unwrapping.swift
//  
//
//  Created by The Northstar✨ System on 2023-08-08.
//

import Foundation



public extension Either {
    
    /// If the held value is the `Left` type, then it's returned. Otherwise, `nil` is returned
    var left: Left? { // TODO: Test
        switch self {
        case .left(let left):
            return left
            
        case .right(_):
            return nil
        }
    }
    
    
    /// If the held value is the `Right` type, then it's returned. Otherwise, `nil` is returned
    var right: Right? { // TODO: Test
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
    /// This is only available when the `Left` type is the same as the `Right` type
    @inline(__always)
    static prefix func ! (_ rhs: Self) -> Value {
        rhs.value
    }
    
    
    /// Unwraps whatever value this has, left or right
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
