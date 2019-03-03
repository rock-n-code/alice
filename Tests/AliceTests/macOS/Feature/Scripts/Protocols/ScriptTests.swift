//
//  ScriptTests.swift
//  Alice
//
//  Created by Javier Cicchelli on 03/03/2019.
//

import XCTest
import Foundation

@testable import Alice

class ScriptTests: XCTestCase {

	// MARK: Static
	
	static var allTests = [("testInitOne", testInitOne),
						   ("testInitTwo", testInitTwo),
						   ("testPathWithResource", testPathWithResource),
						   ("testPathWithoutResource", testPathWithoutResource),]
	
	// MARK: Setup
	
    override func setUp() {
		super.setUp()
    }

    override func tearDown() {
		super.tearDown()
    }
	
	// MARK: Initializers tests
	
	func testInitOne() {
		let script = TestOneScriptMock()
		
		XCTAssertNotNil(script)
		XCTAssertEqual(script.bundle, Bundle(for: ScriptTests.self))
		XCTAssertEqual(script.name, "TestScript")
		XCTAssertEqual(script.type, "command")
		XCTAssertEqual(script.arguments, [])
	}
	
	func testInitTwo() {
		let script = TestTwoScriptMock()
		
		XCTAssertNotNil(script)
		XCTAssertEqual(script.bundle, Bundle(for: ScriptTests.self))
		XCTAssertEqual(script.name, "AnotherScript")
		XCTAssertEqual(script.type, "sh")
		XCTAssertEqual(script.arguments, ["hello"])
	}
	
	// MARK: Properties tests
	
	func testPathWithResource() {
		let script = TestOneScriptMock()
		
		XCTAssertNotNil(script.path)
	}
	
	func testPathWithoutResource() {
		let script = TestTwoScriptMock()
		
		XCTAssertNil(script.path)
	}

}
