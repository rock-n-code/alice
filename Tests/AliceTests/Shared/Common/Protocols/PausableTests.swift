//
//  PausableTests.swift
//  Alice
//
//  Created by Javier Cicchelli on 20/04/2019.
//

import XCTest

@testable import Alice

class PausableTests: XCTestCase {

	// MARK: Static
	
	static var allTests = [
		("testPause", testPause),
	]
	
	// MARK: Functions tests
	
	func testPause() {
		let mock = PausableMock()
		
		XCTAssertFalse(mock.isPaused)
		
		mock.pause()
		
		XCTAssertTrue(mock.isPaused)
	}

}
