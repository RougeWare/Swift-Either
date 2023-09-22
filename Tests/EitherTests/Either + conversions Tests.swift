//
//  Either + conversions Tests.swift
//  
//
//  Created by The Northstar✨ System on 2023-08-11.
//

import XCTest
import Either



final class Either___conversions_Tests: XCTestCase {
    
    // MARK: - Either.init(Optional)
    
    func testFromOptional() {
        let optional_int_nil: Int? = nil
        let eitherOptional_int_nil = Either(optional_int_nil)
        
        switch eitherOptional_int_nil {
        case .left(let left):
            XCTAssertTrue(type(of: left) == Void.self)
            
        case .right(let right):
            XCTFail("How'd \(right) get there??")
        }
        
        
        let optional_int_7: Int? = 7
        let eitherOptional_int_7 = Either(optional_int_7)
        
        switch eitherOptional_int_7 {
        case .left(let left):
            XCTFail("How'd \(left) get there??")
            
        case .right(let right):
            XCTAssertEqual(right, 7)
        }
    }
    
    
    // MARK: - Optional.init(Either)

    func testToOptional() throws {
        let eitherOptional_int_nil = Either<Void, Int>.left(Void())
        let optional_int_nil: Int? = .init(eitherOptional_int_nil)
        
        switch optional_int_nil {
        case .none:
            break
            
        case .some(let value):
            XCTFail("How'd \(value) get there??")
        }
        
        
        let eitherOptional_int_7 = Either<Void, Int>.right(7)
        let optional_int_7: Int? = .init(eitherOptional_int_7)
        
        switch optional_int_7 {
        case .none:
            XCTFail("I figured 7 would be here, but there's nothing at all!")
            
        case .some(let value):
            XCTAssertEqual(value, 7)
        }
    }
    
    
    // MARK: - Either.init(Result)
    
    func testFromResult() {
        let result_stringSuccess = Result<String, DemoError>.success("it work")
        let either_stringSuccess = Either(result_stringSuccess)
        XCTAssertTrue(type(of: either_stringSuccess) == Either<String, DemoError>.self)
        
        switch either_stringSuccess {
        case .left(let left):
            XCTAssertEqual(left, "it work")
            
        case .right(let right):
            XCTFail("How'd \(right) get there??")
        }
        
        
        let result_stringFail = Result<String, DemoError>.failure(.one)
        let either_stringFail = Either(result_stringFail)
        XCTAssertTrue(type(of: either_stringFail) == Either<String, DemoError>.self)
        
        switch either_stringFail {
        case .left(let left):
            XCTFail("How'd \(left) get there??")
            
        case .right(let right):
            XCTAssertEqual(right, .one)
        }
    }
    
    
    // MARK: - Result.init(Either)
    
    func testToResult() {
        let either_stringSuccess = Either<String, DemoError>.left("it work")
        let result_stringSuccess = Result<String, DemoError>(either_stringSuccess)
        XCTAssertTrue(type(of: result_stringSuccess) == Result<String, DemoError>.self)
        
        switch result_stringSuccess {
        case .success(let success):
            XCTAssertEqual(success, "it work")
            
        case .failure(let failure):
            XCTFail("How'd \(failure) get there??")
        }
        
        
        let either_stringFail = Either<String, DemoError>.right(.one)
        let result_stringFail = Result(either_stringFail)
        print(Either.init(either_stringFail))
        XCTAssertTrue(type(of: result_stringFail) == Result<String, DemoError>.self)
        
        switch result_stringFail {
        case .success(let success):
            XCTFail("How'd \(success) get there??")
            
        case .failure(let failure):
            XCTAssertEqual(failure, .one)
        }
    }
}
