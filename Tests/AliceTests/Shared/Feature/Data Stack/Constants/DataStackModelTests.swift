//
//  DataStackModelTests.swift
//  Alice
//
//  Created by Javier Cicchelli on 17/04/2019.
//

import XCTest

@testable import Alice

class DataStackModelTests: XCTestCase {

	// MARK: Static
	
	static var allTests = [
		("testHashValue", testHashValue),
		("testEquality", testEquality),
	]
	
	// MARK: Properties tests
	
	func testHashValue() {
		XCTAssertGreaterThanOrEqual(DataStack.Model.test.hashValue, Int.min)
		XCTAssertLessThanOrEqual(DataStack.Model.test.hashValue, Int.max)
		XCTAssertGreaterThanOrEqual(DataStack.Model.unknown.hashValue, Int.min)
		XCTAssertLessThanOrEqual(DataStack.Model.unknown.hashValue, Int.max)
	}
	
	// MARK: Functions tests

    func testEquality() {
		XCTAssertEqual(DataStack.Model.test, DataStack.Model("Test"))
		XCTAssertEqual(DataStack.Model.unknown, DataStack.Model("Something"))
    }

}
