//
//  ValueTests.swift
//  Alice
//
//  Created by Javier Cicchelli on 17/04/2019.
//

import XCTest

class ValueTests: XCTestCase {

	// MARK: Static
	
	static var allTests = [
		("testInit", testInit),
		("testValue", testValue),
	]
	
	// MARK: Initializers tests

	func testInit() {
		XCTAssertNotNil(StringValueMock("test"))
		XCTAssertNotNil(IntValueMock(1))
		XCTAssertNotNil(ArrayValueMock(["test", "something"]))
    }
	
	// MARK: Properties tests
	
	func testValue() {
		XCTAssertEqual(StringValueMock("test").value, "test")
		XCTAssertEqual(IntValueMock(1).value, 1)
		XCTAssertEqual(ArrayValueMock(["test", "something"]).value, ["test", "something"])
	}

}
