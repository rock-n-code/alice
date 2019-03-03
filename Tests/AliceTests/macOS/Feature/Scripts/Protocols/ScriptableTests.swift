//
//  ScriptableTests.swift
//  Alice
//
//  Created by Javier Cicchelli on 03/03/2019.
//

import XCTest

@testable import Alice

class ScriptableTests: XCTestCase {

	// MARK: Static
	
	static var allTests = [("testInitOne", testInitOne),
						   ("testInitTwo", testInitTwo),]
	
	// MARK: Setup
	
    override func setUp() {
		super.setUp()
    }

    override func tearDown() {
		super.tearDown()
    }
	
	// MARK: Initializers test
	
	func testInitOne() {
		let scriptable = ScriptableOneMock()
		
		XCTAssertNotNil(scriptable)
		XCTAssertNotNil(scriptable.script)
		XCTAssertNotNil(scriptable.script as? TestOneScriptMock)
	}
	
	func testInitTwo() {
		let scriptable = ScriptableTwoMock()
		
		XCTAssertNotNil(scriptable)
		XCTAssertNotNil(scriptable.script)
		XCTAssertNotNil(scriptable.script as? TestTwoScriptMock)
	}

}
