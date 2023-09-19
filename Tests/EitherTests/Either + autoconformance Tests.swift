//
//  Either + autoconformance Tests.swift
//  
//
//  Created by The Northstar✨ System on 2023-08-24.
//

import XCTest

import Either



final class Either___autoconformance_Tests: XCTestCase {

    // MARK: - Either + Equatable
    
    func testEquatable_2types() {
        let either_Int_String_7 = Either<Int, String>.left(7)
        let either_Int_String_foo = Either<Int, String>.right("foo")
        
        let either_String_Int_7 = Either<String, Int>.right(7)
        let either_String_Int_foo = Either<String, Int>.left("foo")
        
        let either_Int_String_42 = Either<Int, String>.left(42)
        let either_Int_String_bar = Either<Int, String>.right("bar")
        
        
        XCTAssertEqual(either_Int_String_7, either_Int_String_7)
        XCTAssertNotEqual(either_Int_String_7, either_Int_String_foo)
        XCTAssertNotEqual(either_Int_String_7, either_Int_String_42)
        XCTAssertNotEqual(either_Int_String_7, either_Int_String_bar)
        
        XCTAssertEqual(either_Int_String_foo, either_Int_String_foo)
        XCTAssertNotEqual(either_Int_String_foo, either_Int_String_7)
        XCTAssertNotEqual(either_Int_String_foo, either_Int_String_42)
        XCTAssertNotEqual(either_Int_String_foo, either_Int_String_bar)
        
        XCTAssertEqual(either_String_Int_7, either_String_Int_7)
        XCTAssertNotEqual(either_String_Int_7, either_String_Int_foo)
        
        XCTAssertEqual(either_String_Int_foo, either_String_Int_foo)
        XCTAssertNotEqual(either_String_Int_foo, either_String_Int_7)
    }
    
    func testEquatable_sameType() {
        let either_String_String_fooLeft = Either<String, String>.left("foo")
        let either_String_String_fooRight = Either<String, String>.right("foo")
        let either_String_String_barLeft = Either<String, String>.left("bar")
        let either_String_String_barRight = Either<String, String>.right("bar")
        
        
        XCTAssertTrue(either_String_String_fooLeft == either_String_String_fooLeft)
        XCTAssertTrue(either_String_String_fooLeft == either_String_String_fooRight)
        XCTAssertFalse(either_String_String_fooLeft != either_String_String_fooLeft)
        XCTAssertFalse(either_String_String_fooLeft != either_String_String_fooRight)
        
        XCTAssertFalse(either_String_String_fooLeft == either_String_String_barLeft)
        XCTAssertFalse(either_String_String_fooLeft == either_String_String_barRight)
        XCTAssertTrue(either_String_String_fooLeft != either_String_String_barLeft)
        XCTAssertTrue(either_String_String_fooLeft != either_String_String_barRight)
        
        
        XCTAssertTrue(either_String_String_fooRight == either_String_String_fooLeft)
        XCTAssertTrue(either_String_String_fooRight == either_String_String_fooRight)
        XCTAssertFalse(either_String_String_fooRight != either_String_String_fooLeft)
        XCTAssertFalse(either_String_String_fooRight != either_String_String_fooRight)
        
        XCTAssertFalse(either_String_String_fooRight == either_String_String_barLeft)
        XCTAssertFalse(either_String_String_fooRight == either_String_String_barRight)
        XCTAssertTrue(either_String_String_fooRight != either_String_String_barLeft)
        XCTAssertTrue(either_String_String_fooRight != either_String_String_barRight)
        
        
        XCTAssertFalse(either_String_String_barLeft == either_String_String_fooLeft)
        XCTAssertFalse(either_String_String_barLeft == either_String_String_fooRight)
        XCTAssertTrue(either_String_String_barLeft != either_String_String_fooLeft)
        XCTAssertTrue(either_String_String_barLeft != either_String_String_fooRight)
        
        XCTAssertTrue(either_String_String_barLeft == either_String_String_barLeft)
        XCTAssertTrue(either_String_String_barLeft == either_String_String_barRight)
        XCTAssertFalse(either_String_String_barLeft != either_String_String_barLeft)
        XCTAssertFalse(either_String_String_barLeft != either_String_String_barRight)
        
        
        XCTAssertFalse(either_String_String_barRight == either_String_String_fooLeft)
        XCTAssertFalse(either_String_String_barRight == either_String_String_fooRight)
        XCTAssertTrue(either_String_String_barRight != either_String_String_fooLeft)
        XCTAssertTrue(either_String_String_barRight != either_String_String_fooRight)
        
        XCTAssertTrue(either_String_String_barRight == either_String_String_barLeft)
        XCTAssertTrue(either_String_String_barRight == either_String_String_barRight)
        XCTAssertFalse(either_String_String_barRight != either_String_String_barLeft)
        XCTAssertFalse(either_String_String_barRight != either_String_String_barRight)
    }
    
    
    
    // MARK: - Either + Comparable
    
    func testComparable_2types() {
        let either_Int_Float_7 = Either<Int, Float>.left(7)
        let either_Int_Float_pi = Either<Int, Float>.right(.pi)
        
        let either_Int_Float_42 = Either<Int, Float>.left(42)
        let either_Int_Float_sqrt2 = Either<Int, Float>.right(Float(2).squareRoot())
        
        
        XCTAssertEqual(either_Int_Float_7, either_Int_Float_7)
        XCTAssertFalse(either_Int_Float_7 < either_Int_Float_pi)
        XCTAssertFalse(either_Int_Float_7 > either_Int_Float_pi)
        XCTAssertFalse(either_Int_Float_7 == either_Int_Float_pi)
        
        XCTAssertLessThan(either_Int_Float_7, either_Int_Float_42)
        XCTAssertFalse(either_Int_Float_7 < either_Int_Float_sqrt2)
        XCTAssertFalse(either_Int_Float_7 > either_Int_Float_sqrt2)
        XCTAssertFalse(either_Int_Float_7 == either_Int_Float_sqrt2)
        
        
        XCTAssertFalse(either_Int_Float_pi < either_Int_Float_7)
        XCTAssertFalse(either_Int_Float_pi > either_Int_Float_7)
        XCTAssertFalse(either_Int_Float_pi == either_Int_Float_7)
        XCTAssertEqual(either_Int_Float_pi, either_Int_Float_pi)
        XCTAssertFalse(either_Int_Float_pi < either_Int_Float_42)
        XCTAssertFalse(either_Int_Float_pi > either_Int_Float_42)
        XCTAssertFalse(either_Int_Float_pi == either_Int_Float_42)
        XCTAssertGreaterThan(either_Int_Float_pi, either_Int_Float_sqrt2)
        
        
        XCTAssertGreaterThan(either_Int_Float_42, either_Int_Float_7)
        XCTAssertFalse(either_Int_Float_42 < either_Int_Float_pi)
        XCTAssertFalse(either_Int_Float_42 > either_Int_Float_pi)
        XCTAssertFalse(either_Int_Float_42 == either_Int_Float_pi)
        XCTAssertEqual(either_Int_Float_42, either_Int_Float_42)
        XCTAssertFalse(either_Int_Float_42 < either_Int_Float_sqrt2)
        XCTAssertFalse(either_Int_Float_42 > either_Int_Float_sqrt2)
        XCTAssertFalse(either_Int_Float_42 == either_Int_Float_sqrt2)
        
        
        XCTAssertFalse(either_Int_Float_sqrt2 < either_Int_Float_7)
        XCTAssertFalse(either_Int_Float_sqrt2 > either_Int_Float_7)
        XCTAssertFalse(either_Int_Float_sqrt2 == either_Int_Float_7)
        XCTAssertLessThan(either_Int_Float_sqrt2, either_Int_Float_pi)
        XCTAssertFalse(either_Int_Float_sqrt2 < either_Int_Float_42)
        XCTAssertFalse(either_Int_Float_sqrt2 > either_Int_Float_42)
        XCTAssertFalse(either_Int_Float_sqrt2 == either_Int_Float_42)
        XCTAssertEqual(either_Int_Float_sqrt2, either_Int_Float_sqrt2)
    }
    
    
    func testComparable_sameType() {
        let either_Float_Float_7 = Either<Float, Float>.left(7)
        let either_Float_Float_pi = Either<Float, Float>.right(.pi)
        
        let either_Float_Float_42 = Either<Float, Float>.left(42)
        let either_Float_Float_sqrt2 = Either<Float, Float>.right(Float(2).squareRoot())
        
        
        XCTAssertFalse(either_Float_Float_7 <  either_Float_Float_7)
        XCTAssertTrue (either_Float_Float_7 <= either_Float_Float_7)
        XCTAssertTrue (either_Float_Float_7 == either_Float_Float_7)
        XCTAssertTrue (either_Float_Float_7 >= either_Float_Float_7)
        XCTAssertFalse(either_Float_Float_7 >  either_Float_Float_7)
        
        XCTAssertFalse(either_Float_Float_7 <  either_Float_Float_pi)
        XCTAssertFalse(either_Float_Float_7 <= either_Float_Float_pi)
        XCTAssertFalse(either_Float_Float_7 == either_Float_Float_pi)
        XCTAssertTrue (either_Float_Float_7 >= either_Float_Float_pi)
        XCTAssertTrue (either_Float_Float_7 >  either_Float_Float_pi)
        
        XCTAssertTrue (either_Float_Float_7 <  either_Float_Float_42)
        XCTAssertTrue (either_Float_Float_7 <= either_Float_Float_42)
        XCTAssertFalse(either_Float_Float_7 == either_Float_Float_42)
        XCTAssertFalse(either_Float_Float_7 >= either_Float_Float_42)
        XCTAssertFalse(either_Float_Float_7 >  either_Float_Float_42)
        
        XCTAssertFalse(either_Float_Float_7 <  either_Float_Float_sqrt2)
        XCTAssertFalse(either_Float_Float_7 <= either_Float_Float_sqrt2)
        XCTAssertFalse(either_Float_Float_7 == either_Float_Float_sqrt2)
        XCTAssertTrue (either_Float_Float_7 >= either_Float_Float_sqrt2)
        XCTAssertTrue (either_Float_Float_7 >  either_Float_Float_sqrt2)
        
        
        XCTAssertTrue (either_Float_Float_pi <  either_Float_Float_7)
        XCTAssertTrue (either_Float_Float_pi <= either_Float_Float_7)
        XCTAssertFalse(either_Float_Float_pi == either_Float_Float_7)
        XCTAssertFalse(either_Float_Float_pi >= either_Float_Float_7)
        XCTAssertFalse(either_Float_Float_pi >  either_Float_Float_7)
        
        XCTAssertFalse(either_Float_Float_pi <  either_Float_Float_pi)
        XCTAssertTrue (either_Float_Float_pi <= either_Float_Float_pi)
        XCTAssertTrue (either_Float_Float_pi == either_Float_Float_pi)
        XCTAssertTrue (either_Float_Float_pi >= either_Float_Float_pi)
        XCTAssertFalse(either_Float_Float_pi >  either_Float_Float_pi)
        
        XCTAssertTrue (either_Float_Float_pi <  either_Float_Float_42)
        XCTAssertTrue (either_Float_Float_pi <= either_Float_Float_42)
        XCTAssertFalse(either_Float_Float_pi == either_Float_Float_42)
        XCTAssertFalse(either_Float_Float_pi >= either_Float_Float_42)
        XCTAssertFalse(either_Float_Float_pi >  either_Float_Float_42)
        
        XCTAssertFalse(either_Float_Float_pi <  either_Float_Float_sqrt2)
        XCTAssertFalse(either_Float_Float_pi <= either_Float_Float_sqrt2)
        XCTAssertFalse(either_Float_Float_pi == either_Float_Float_sqrt2)
        XCTAssertTrue (either_Float_Float_pi >= either_Float_Float_sqrt2)
        XCTAssertTrue (either_Float_Float_pi >  either_Float_Float_sqrt2)
        
        
        XCTAssertFalse(either_Float_Float_42 <  either_Float_Float_7)
        XCTAssertFalse(either_Float_Float_42 <= either_Float_Float_7)
        XCTAssertFalse(either_Float_Float_42 == either_Float_Float_7)
        XCTAssertTrue (either_Float_Float_42 >= either_Float_Float_7)
        XCTAssertTrue (either_Float_Float_42 >  either_Float_Float_7)
        
        XCTAssertFalse(either_Float_Float_42 <  either_Float_Float_pi)
        XCTAssertFalse(either_Float_Float_42 <= either_Float_Float_pi)
        XCTAssertFalse(either_Float_Float_42 == either_Float_Float_pi)
        XCTAssertTrue (either_Float_Float_42 >= either_Float_Float_pi)
        XCTAssertTrue (either_Float_Float_42 >  either_Float_Float_pi)
        
        XCTAssertFalse(either_Float_Float_42 <  either_Float_Float_42)
        XCTAssertTrue (either_Float_Float_42 <= either_Float_Float_42)
        XCTAssertTrue (either_Float_Float_42 == either_Float_Float_42)
        XCTAssertTrue (either_Float_Float_42 >= either_Float_Float_42)
        XCTAssertFalse(either_Float_Float_42 >  either_Float_Float_42)
        
        XCTAssertFalse(either_Float_Float_42 <  either_Float_Float_sqrt2)
        XCTAssertFalse(either_Float_Float_42 <= either_Float_Float_sqrt2)
        XCTAssertFalse(either_Float_Float_42 == either_Float_Float_sqrt2)
        XCTAssertTrue (either_Float_Float_42 >= either_Float_Float_sqrt2)
        XCTAssertTrue (either_Float_Float_42 >  either_Float_Float_sqrt2)
        
        
        XCTAssertTrue (either_Float_Float_sqrt2 <  either_Float_Float_7)
        XCTAssertTrue (either_Float_Float_sqrt2 <= either_Float_Float_7)
        XCTAssertFalse(either_Float_Float_sqrt2 == either_Float_Float_7)
        XCTAssertFalse(either_Float_Float_sqrt2 >= either_Float_Float_7)
        XCTAssertFalse(either_Float_Float_sqrt2 >  either_Float_Float_7)
        
        XCTAssertTrue (either_Float_Float_sqrt2 <  either_Float_Float_pi)
        XCTAssertTrue (either_Float_Float_sqrt2 <= either_Float_Float_pi)
        XCTAssertFalse(either_Float_Float_sqrt2 == either_Float_Float_pi)
        XCTAssertFalse(either_Float_Float_sqrt2 >= either_Float_Float_pi)
        XCTAssertFalse(either_Float_Float_sqrt2 >  either_Float_Float_pi)
        
        XCTAssertTrue (either_Float_Float_sqrt2 <  either_Float_Float_42)
        XCTAssertTrue (either_Float_Float_sqrt2 <= either_Float_Float_42)
        XCTAssertFalse(either_Float_Float_sqrt2 == either_Float_Float_42)
        XCTAssertFalse(either_Float_Float_sqrt2 >= either_Float_Float_42)
        XCTAssertFalse(either_Float_Float_sqrt2 >  either_Float_Float_42)
        
        XCTAssertFalse(either_Float_Float_sqrt2 < either_Float_Float_sqrt2)
        XCTAssertTrue (either_Float_Float_sqrt2 <= either_Float_Float_sqrt2)
        XCTAssertTrue (either_Float_Float_sqrt2 == either_Float_Float_sqrt2)
        XCTAssertTrue (either_Float_Float_sqrt2 >= either_Float_Float_sqrt2)
        XCTAssertFalse(either_Float_Float_sqrt2 >  either_Float_Float_sqrt2)
    }
    
    
    
    // MARK: - Either + Hashable
    
    func testHashable() {
        struct TestHashable: Hashable {
            func hash(into hasher: inout Hasher) {
                hasher.combine(0)
            }
        }
        
        let either_UInt_TestHashable_7 = Either<UInt, TestHashable>.left(7)
        let either_UInt_TestHashable_test = Either<UInt, TestHashable>.right(.init())
        
        XCTAssertEqual(either_UInt_TestHashable_7.hashValue, (7 as UInt).hashValue)
        XCTAssertEqual(either_UInt_TestHashable_test.hashValue, TestHashable().hashValue)
    }
    
    
    
    // MARK: - Either + CustomStringConvertible
    
    func testCustomStringConvertible() {
        struct TestCSC: CustomStringConvertible {
            var description: String { "Test Custom String" }
        }
        
        let either_Int16_TestCSC_42 = Either<Int16, TestCSC>.left(42)
        let either_Int16_TestCSC_test = Either<Int16, TestCSC>.right(.init())
        
        XCTAssertEqual(either_Int16_TestCSC_42.description, "42")
        XCTAssertEqual(either_Int16_TestCSC_test.description, "Test Custom String")
    }
    
    
    
    // MARK: - Either + CustomDebugStringConvertible
    
    func testCustomDebugStringConvertible() {
        struct TestCDSC_1: CustomDebugStringConvertible {
            var description: String { "Test Custom String" }
            var debugDescription: String { "<TestCDSC_1 />" }
        }
        struct TestCDSC_2: CustomDebugStringConvertible {
            var description: String { "Another Test Custom String" }
            var debugDescription: String { "<TestCDSC_2 />" }
        }
        
        let either__TestCDSC_1__TestCDSC_2__1 = Either<TestCDSC_1, TestCDSC_2>.left(.init())
        let either__TestCDSC_1__TestCDSC_2__2 = Either<TestCDSC_1, TestCDSC_2>.right(.init())
        
        XCTAssertEqual(either__TestCDSC_1__TestCDSC_2__1.debugDescription, "<TestCDSC_1 />")
        XCTAssertEqual(either__TestCDSC_1__TestCDSC_2__2.debugDescription, "<TestCDSC_2 />")
    }
    
    
    
    // MARK: - Either + Codable/Encodable/Decodable
    
    func testCodable() throws {
        typealias CurrentEither = Either<TestCodable, Int>
        
        
        
        struct TestCodable: Codable, Equatable {
            var name: String
            var description: String?
            var id: UUID
            var value: CGFloat
            var isTracked: Bool
        }
        
        
        
        struct Wrapper: Codable, Equatable {
            let wrapped: CurrentEither
        }
        
        
        
        for _ in 1 ... 20 {
            let either_TestCodable_Int_randomTest = CurrentEither.left(.init(
                name: "Dax",
                description: Bool.random() ? "A snepderg who helps others" : nil,
                id: UUID(),
                value: .random(in: -100 ... 100),
                isTracked: .random()))
            
            let either_TestCodable_Int_randomInt = CurrentEither.right(.random(in: -100 ... 100))
            
            let wrapped_randomTest = Wrapper(wrapped: either_TestCodable_Int_randomTest)
            let wrapped_randomInt = Wrapper(wrapped: either_TestCodable_Int_randomInt)
            
            let encoder = JSONEncoder()
            encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
            
            let decoder = JSONDecoder()
            
            let encoded_randomTest = try encoder.encode(either_TestCodable_Int_randomTest)
            let encoded_randomInt = try encoder.encode(either_TestCodable_Int_randomInt)
            let encoded_wrapped_randomTest = try encoder.encode(wrapped_randomTest)
            let encoded_wrapped_randomInt = try encoder.encode(wrapped_randomInt)
            
            let decoded_randomTest = try decoder.decode(CurrentEither.self, from: encoded_randomTest)
            let decoded_randomInt = try decoder.decode(CurrentEither.self, from: encoded_randomInt)
            let decoded_wrapped_randomTest = try decoder.decode(Wrapper.self, from: encoded_wrapped_randomTest)
            let decoded_wrapped_randomInt = try decoder.decode(Wrapper.self, from: encoded_wrapped_randomInt)
            
            XCTAssertEqual(either_TestCodable_Int_randomTest, decoded_randomTest)
            XCTAssertEqual(either_TestCodable_Int_randomInt, decoded_randomInt)
            XCTAssertEqual(wrapped_randomTest, decoded_wrapped_randomTest)
            XCTAssertEqual(wrapped_randomInt, decoded_wrapped_randomInt)
        }
    }
}
