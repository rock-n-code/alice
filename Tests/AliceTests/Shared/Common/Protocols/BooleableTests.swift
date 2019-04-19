//
//  BooleableTests.swift
//  Alice
//
//  Created by Javier Cicchelli on 18/03/2019.
//

import XCTest

@testable import Alice

class BooleableTests: XCTestCase {

	// MARK: Static
	
	static var allTests = [
		("testInit", testInit),
		("testAsBool", testAsBool)
	]
	
	// MARK: Setup
	
    override func setUp() {
		super.setUp()
    }

    override func tearDown() {
		super.tearDown()
    }
	
	// MARK: Initializers tests
	
	func testInit() {
		XCTAssertNotNil(BooleableMock(bool: true))
		XCTAssertNotNil(BooleableMock(bool: false))
	}
	
	// MARK: Functions tests
	
	func testAsBool() {
		let testTrue = BooleableMock(bool: true)
		let testFalse = BooleableMock(bool: false)
		
		XCTAssertEqual(testTrue.asBool(), true)
		XCTAssertEqual(testFalse.asBool(), false)
	}

}
