//
//  URLableTests.swift
//  Alice
//
//  Created by Javier Cicchelli on 16/04/2019.
//

import XCTest

class URLableTests: XCTestCase {

	// MARK: Static
	
	static var allTests = [
		("testAsURL", testAsURL),
	]
	
	// MARK: Setup
	
    override func setUp() {
		super.setUp()
    }

    override func tearDown() {
		super.tearDown()
    }
	
	// MARK: Functions tests

    func testAsURL() {
		XCTAssertEqual(URLableMock().asURL(), URL(string: "https://www.google.com"))
    }

}
