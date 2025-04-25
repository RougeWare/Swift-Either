//
//  Either.swift
//  
//
//  Created by The Northstar✨ System on 2023-08-07.
//

import Foundation



/// Allows you to use a value which can be one of two possible types, but not both
public enum Either<Left, Right> {
    case left(Left)
    case right(Right)
}



// MARK: - Sendable
// (this would be in `Either + autoconformance.swift`, but the compiler prefers it in the same file as the original declaration

extension Either: Sendable where Left: Sendable, Right: Sendable {}
