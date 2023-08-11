//
//  Either + conversions.swift
//
//
//  Created by The Northstar✨ System on 2023-08-08.
//

import Foundation



// MARK: - Either ↔️ Optional

public extension Either where Left == Void {
    /// Converts an `Optional` into an `Either`, converting the `.none` case into `.left(Void())`, and `.some(right)` into `.right(right)`
    ///
    /// - Parameter optional: The value to be converted into an `Either`
    init(_ optional: Optional<Right>) { // TODO: Test
        switch optional {
        case .none: 
            self = .left(())
            
        case .some(let right):
            self = .right(right)
        }
    }
}



public extension Optional {
    /// Converts an `Either` into an `Optional`.
    ///
    /// The given `Either` must have its `Left` be `Void`. The `Right` will be treated as the possibly-nil value when it's not nil
    ///
    /// - Parameter either: The `Either` which can be represented as an `Optional<Right>`
    init(_ either: Either<Void, Wrapped>) {
        switch either {
        case .left(_):
            self = .none
            
        case .right(let right):
            self = .some(right)
        }
    }
}



// MARK: - Either ↔️ Result

public extension Either where Right: Error {
    /// Converts a `Result` into an `Either`, converting the `.success(value)` case into `.left(value)`, and `.failure(error)` into `.right(error)`
    ///
    /// - Parameter result: The value to be converted into an `Either`
    init(_ result: Result<Left, Right>) {
        switch result {
        case .success(let success):
            self = .left(success)
            
        case .failure(let failure):
            self = .right(failure)
        }
    }
}



public extension Result {
    /// Converts an `Either` into a `Result`.
    ///
    /// The given `Either`'s `Left` will be treated as the `Success`, and the `Right` will be treated as the `Failure`, so `Right` must be an `Error`
    ///
    /// - Parameter either: The `Either` which can be represented as a `Result<Left, Right>`
    init(_ either: Either<Success, Failure>) { // TODO: Test
        switch either {
        case .left(let left):
            self = .success(left)
            
        case .right(let right):
            self = .failure(right)
        }
    }
}
