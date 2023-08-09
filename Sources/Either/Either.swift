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
