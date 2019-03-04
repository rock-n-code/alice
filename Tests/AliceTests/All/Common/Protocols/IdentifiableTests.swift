//
//  IdentifiableTests.swift
//  KashmirTests
//
//  Created by Javier Cicchelli on 06/09/2018.
//  Copyright © 2018 Rock & Code. All rights reserved.
//

import XCTest

@testable import Alice

class IdentifiableTests: XCTestCase {
	
	// MARK: Setup
	
	override func setUp() {
		super.setUp()
	}
	
	override func tearDown() {
		super.tearDown()
	}
	
	// MARK: Static tests
	
	func testStaticIdentify() {
		XCTAssertEqual(OneTest.identify(), "OneTest")
		XCTAssertEqual(TwoTest.identify(), "TwoTest")
	}
	
	// MARK: Properties tests
	
	func testIdentify() {
		XCTAssertEqual(OneTest().identify(), "OneTest")
		XCTAssertEqual(TwoTest().identify(), "TwoTest")
	}
	
}

// MARK: - Mocks

private class OneTest: Identifiable {}
private class TwoTest: NSObject, Identifiable {}
