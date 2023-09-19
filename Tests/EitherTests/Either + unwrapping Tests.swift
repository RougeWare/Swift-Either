//
//  Either + map Tests.swift
//  
//
//  Created by The Northstar✨ System on 2023-08-08.
//

import XCTest

import Either



final class Either_unwrapping_Tests: XCTestCase {
    
    // MARK: - `.left` & `.right`
    
    func test_left_right_hetero() {
        XCTAssertEqual(stringLeft.left, "Left Classic")
        XCTAssertNil(stringLeft.right)
        
        XCTAssertNil(intRight.left)
        XCTAssertEqual(intRight.right, 8008)
    }
    
    
    func test_left_right_homo() {
        let stringLeft = Either<String, String>.left("Left Unity")
        let stringRight = Either<String, String>.right("Starboard")
        
        XCTAssertEqual(stringLeft.left, "Left Unity")
        XCTAssertNil(stringLeft.right)
        
        XCTAssertNil(stringRight.left)
        XCTAssertEqual(stringRight.right, "Starboard")
    }
    
    
    
    // MARK: - `.value` and `*`
    
    func testValue() {
        let stringLeft = Either<String, String>.left("Left Unity")
        let stringRight = Either<String, String>.right("Starboard")
        
        XCTAssertEqual(stringLeft.value, "Left Unity")
        XCTAssertEqual(*stringLeft, "Left Unity")
        
        XCTAssertEqual(stringRight.value, "Starboard")
        XCTAssertEqual(*stringRight, "Starboard")
    }
}
