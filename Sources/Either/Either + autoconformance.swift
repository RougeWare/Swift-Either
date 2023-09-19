//
//  Either + autoconformance.swift
//  
//
//  Created by The Northstar✨ System on 2023-08-08.
//

import Foundation



// MARK: - Equatable

extension Either: Equatable where Left: Equatable, Right: Equatable {
    
    @inlinable
    public static func == (lhs: Self, rhs: Self) -> Bool {
        switch (a: lhs, b: rhs) {
        case (a: .left(let leftA), b: .left(let leftB)):
            return leftA == leftB
            
        case (a: .right(let rightA), b: .right(let rightB)):
            return rightA == rightB
            
        default:
            return false
        }
    }
    
    
    @inlinable
    public static func == (lhs: Self, rhs: Self) -> Bool
    where Left == Right
    {
        switch (a: lhs, b: rhs) {
        case (a: .left(let a),  b: .left(let b)),
             (a: .right(let a), b: .right(let b)),
             (a: .left(let a),  b: .right(let b)),
             (a: .right(let a), b: .left(let b)):
            return a == b
        }
    }
    
    
    @inline(__always)
    public static func != (lhs: Self, rhs: Self) -> Bool
    where Left == Right
    {
        !(lhs == rhs)
    }
}



// MARK: - Comparable

extension Either: Comparable where Left: Comparable, Right: Comparable {
    
    @inlinable
    public static func < (lhs: Self, rhs: Self) -> Bool {
        switch (a: lhs, b: rhs) {
        case (a: .left(let leftA), b: .left(let leftB)):
            return leftA < leftB
            
        case (a: .right(let rightA), b: .right(let rightB)):
            return rightA < rightB
            
        default:
            return false
        }
    }
    
    
    @inlinable
    public static func < (lhs: Self, rhs: Self) -> Bool
    where Left == Right
    {
        switch (a: lhs, b: rhs) {
        case (a: .left(let a),  b: .left(let b)),
            (a: .right(let a), b: .right(let b)),
            (a: .left(let a),  b: .right(let b)),
            (a: .right(let a), b: .left(let b)):
            return a < b
        }
    }
}



// Swift compiler requires this be a separate extension for some reason
public extension Either where Left: Comparable, Right: Comparable {
    
    @inlinable
    static func <= (lhs: Self, rhs: Self) -> Bool
    where Left == Right
    {
        switch (a: lhs, b: rhs) {
        case (a: .left(let a),  b: .left(let b)),
             (a: .right(let a), b: .right(let b)),
             (a: .left(let a),  b: .right(let b)),
             (a: .right(let a), b: .left(let b)):
            return a <= b
        }
    }
    
    
    @inlinable
    static func >= (lhs: Self, rhs: Self) -> Bool
    where Left == Right
    {
        switch (a: lhs, b: rhs) {
        case (a: .left(let a),  b: .left(let b)),
             (a: .right(let a), b: .right(let b)),
             (a: .left(let a),  b: .right(let b)),
             (a: .right(let a), b: .left(let b)):
            return a >= b
        }
    }
    
    
    @inlinable
    static func > (lhs: Self, rhs: Self) -> Bool
    where Left == Right
    {
        switch (a: lhs, b: rhs) {
        case (a: .left(let a),  b: .left(let b)),
             (a: .right(let a), b: .right(let b)),
             (a: .left(let a),  b: .right(let b)),
             (a: .right(let a), b: .left(let b)):
            return a > b
        }
    }
}



// MARK: - Hashable

extension Either: Hashable where Left: Hashable, Right: Hashable {
    public func hash(into hasher: inout Hasher) {
        switch self {
        case .left(let left):   left.hash(into: &hasher)
        case .right(let right): right.hash(into: &hasher)
        }
    }
}



// MARK: - CustomStringConvertible

extension Either: CustomStringConvertible where Left: CustomStringConvertible, Right: CustomStringConvertible {
    public var description: String {
        switch self {
        case .left(let left):
            return left.description
            
        case .right(let right):
            return right.description
        }
    }
}



// MARK: - CustomDebugStringConvertible

extension Either: CustomDebugStringConvertible where Left: CustomDebugStringConvertible, Right: CustomDebugStringConvertible {
    public var debugDescription: String {
        switch self {
        case .left(let left):
            return left.debugDescription
            
        case .right(let right):
            return right.debugDescription
        }
    }
}



// MARK: - Codable

private extension Either {
    enum CodingKey: String, Swift.CodingKey {
        case left
        case right
    }
}



// MARK: - Encodable

extension Either: Encodable where Left: Encodable, Right: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKey.self)
        
        switch self {
        case .left(let left):
            try container.encode(left, forKey: .left)
            
        case .right(let right):
            try container.encode(right, forKey: .right)
        }
    }
}



// MARK: - Decodable

extension Either: Decodable where Left: Decodable, Right: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKey.self)
        
        if let left = try container.decodeIfPresent(Left.self, forKey: .left) {
            self = .left(left)
        }
        else if let right = try container.decodeIfPresent(Right.self, forKey: .right) {
            self = .right(right)
        }
        else {
            throw NeitherLeftNorRightValueWasEncoded()
        }
    }
    
    
    
    /// Thrown when attempting to decode an `Either`, but neither the `left` nor the `right` value was found in the encoded container
    public struct NeitherLeftNorRightValueWasEncoded: Error {}
}
