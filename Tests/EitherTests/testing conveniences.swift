//
//  File.swift
//  
//
//  Created by The Northstar✨ System on 2023-08-11.
//

import Foundation
import Either



internal let stringLeft = Either<String, Int>.left("Left Classic")
internal let intRight = Either<String, Int>.right(8008)



internal enum DemoError: Error {
    case one
}
