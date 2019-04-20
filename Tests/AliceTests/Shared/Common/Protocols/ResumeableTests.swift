//
//  ResumeableTests.swift
//  Alice
//
//  Created by Javier Cicchelli on 20/04/2019.
//

import XCTest

@testable import Alice

class ResumeableTests: XCTestCase {

	// MARK: Static
	
	static var allTests = [
		("testResume", testResume),
	]
	
	// MARK: Setup
	
    override func setUp() {
		super.setUp()
    }

    override func tearDown() {
		super.tearDown()
    }

	// MARK: Functions tests
	
	func testResume() {
		let mock = ResumeableMock()
		
		XCTAssertFalse(mock.isResumed)
		
		mock.resume()
		
		XCTAssertTrue(mock.isResumed)
	}
	
}
