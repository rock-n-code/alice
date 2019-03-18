//
//  BooleableTests.swift
//  Alice
//
//  Created by Javier Cicchelli on 18/03/2019.
//

import XCTest

@testable import Alice

class BooleableTests: XCTestCase {

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
		let testOne = BooleableMock(bool: true)
		let testTwo = BooleableMock(bool: false)
		
		XCTAssertEqual(testOne.asBool(), true)
		XCTAssertEqual(testTwo.asBool(), false)
	}

}
