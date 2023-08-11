//
//  Either + map Tests.swift
//  
//
//  Created by The Northstar✨ System on 2023-08-08.
//

import XCTest

import Either



final class Either___map_Tests: XCTestCase {
    
    // MARK: - .map(left:right:)
    
    func testMapLeftRight_String_Int() throws {
        
        let stringSwap = stringLeft.map(left: { _ in 420 }, right: { _ in "Neue Right" })
        XCTAssertTrue(type(of: stringSwap) == Either<Int, String>.self)
        switch stringSwap {
        case .left(let left):
            XCTAssertEqual(left, 420)
            
        case .right(let right):
            XCTFail("How'd '\(right)' get there??")
        }
        
        let intSwap = intRight.map(left: { _ in 420 }, right: { _ in "Neue Right" })
        XCTAssertTrue(type(of: intSwap) == Either<Int, String>.self)
        switch intSwap {
        case .left(let left):
            XCTFail("How'd '\(left)' get there??")
            
        case .right(let right):
            XCTAssertEqual(right, "Neue Right")
        }
        
        
        let stringSame = stringLeft.map(left: { "\($0) 2" }, right: { ($0 * 10) + 2 })
        XCTAssertTrue(type(of: stringSame) == Either<String, Int>.self)
        switch stringSame {
        case .left(let left):
            XCTAssertEqual(left, "Left Classic 2")
            
        case .right(let right):
            XCTFail("How'd '\(right)' get there??")
        }
        
        let intSame = intRight.map(left: { "\($0) 2" }, right: { ($0 * 10) + 5 })
        XCTAssertTrue(type(of: intSame) == Either<String, Int>.self)
        switch intSame {
        case .left(let left):
            XCTFail("How'd '\(left)' get there??")
            
        case .right(let right):
            XCTAssertEqual(right, 80085)
        }
    }
    
    
    
    // MARK: - .map(left:)
    
    func testMapLeft_String_Int() {
        
        let stringSwap = stringLeft.map(left: { _ in 420 })
        XCTAssertTrue(type(of: stringSwap) == Either<Int, Int>.self)
        switch stringSwap {
        case .left(let left):
            XCTAssertEqual(left, 420)
            
        case .right(let right):
            XCTFail("How'd '\(right)' get there??")
        }
        
        let intSwap = intRight.map(left: { _ in 420 })
        XCTAssertTrue(type(of: intSwap) == Either<Int, Int>.self)
        switch intSwap {
        case .left(let left):
            XCTFail("How'd '\(left)' get there??")
            
        case .right(let right):
            XCTAssertEqual(right, 8008)
        }
        
        
        let stringSame = stringLeft.map(left: { "\($0) 2" })
        XCTAssertTrue(type(of: stringSame) == Either<String, Int>.self)
        switch stringSame {
        case .left(let left):
            XCTAssertEqual(left, "Left Classic 2")
            
        case .right(let right):
            XCTFail("How'd '\(right)' get there??")
        }
        
        let intSame = intRight.map(left: { "\($0) 2" })
        XCTAssertTrue(type(of: intSame) == Either<String, Int>.self)
        switch intSame {
        case .left(let left):
            XCTFail("How'd '\(left)' get there??")
            
        case .right(let right):
            XCTAssertEqual(right, 8008)
        }
    }
    
    
    
    // MARK: - .map(right:)
    
    func testMapRight_String_Int() throws {
        
        let stringSwap = stringLeft.map(right: { _ in "Neue Right" })
        XCTAssertTrue(type(of: stringSwap) == Either<String, String>.self)
        switch stringSwap {
        case .left(let left):
            XCTAssertEqual(left, "Left Classic")
            
        case .right(let right):
            XCTFail("How'd '\(right)' get there??")
        }
        
        let intSwap = intRight.map(right: { _ in "Neue Right" })
        XCTAssertTrue(type(of: intSwap) == Either<String, String>.self)
        switch intSwap {
        case .left(let left):
            XCTFail("How'd '\(left)' get there??")
            
        case .right(let right):
            XCTAssertEqual(right, "Neue Right")
        }
        
        
        let stringSame = stringLeft.map(right: { ($0 * 10) + 2 })
        XCTAssertTrue(type(of: stringSame) == Either<String, Int>.self)
        switch stringSame {
        case .left(let left):
            XCTAssertEqual(left, "Left Classic")
            
        case .right(let right):
            XCTFail("How'd '\(right)' get there??")
        }
        
        let intSame = intRight.map(right: { ($0 * 10) + 5 })
        XCTAssertTrue(type(of: intSame) == Either<String, Int>.self)
        switch intSame {
        case .left(let left):
            XCTFail("How'd '\(left)' get there??")
            
        case .right(let right):
            XCTAssertEqual(right, 80085)
        }
    }
    
    
    
    // MARK: - _autoMap(_:)
    
    func test_autoMap() {
        let stringLeft_doubleCounted = stringLeft._autoMap { $0.count * 2 }
        XCTAssertTrue(type(of: stringLeft_doubleCounted) == Either<Int, Int>.self)
        switch stringLeft_doubleCounted {
        case .left(let left):
            XCTAssertEqual(left, 24)
            
        case .right(let right):
            XCTFail("How'd \(right) get there??")
        }
        
        
        let stringLeft_squared = stringLeft._autoMap { $0 * $0 }
        XCTAssertTrue(type(of: stringLeft_squared) == Either<String, Int>.self)
        switch stringLeft_squared {
        case .left(let left):
            XCTAssertEqual(left, "Left Classic")
            
        case .right(let right):
            XCTFail("How'd \(right) get there??")
        }
        
        
        let intRight_doubleCounted = intRight._autoMap { $0.count * 2 }
        XCTAssertTrue(type(of: intRight_doubleCounted) == Either<Int, Int>.self)
        switch intRight_doubleCounted {
        case .left(let left):
            XCTFail("How'd \(left) get there??")
            
        case .right(let right):
            XCTAssertEqual(right, 8008)
        }
        
        
        let intRight_squared = intRight._autoMap { $0.description }
        XCTAssertTrue(type(of: intRight_squared) == Either<String, Int>.self)
        switch intRight_squared {
        case .left(let left):
            XCTFail("How'd \(left) get there??")
            
        case .right(let right):
            XCTAssertEqual(right, 64_128_064)
        }
    }
}
