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
	
	// MARK: Static
	
	static var allTests = [
		("testStaticIdentify", testStaticIdentify),
		("testIdentify", testIdentify)
	]
	
	// MARK: Setup
	
	override func setUp() {
		super.setUp()
	}
	
	override func tearDown() {
		super.tearDown()
	}
	
	// MARK: Static tests
	
	func testStaticIdentify() {
		XCTAssertEqual(IdentifiableMock.identify(), "IdentifiableMock")
	}
	
	// MARK: Properties tests
	
	func testIdentify() {
		XCTAssertEqual(IdentifiableMock().identify(), "IdentifiableMock")
	}
	
}
