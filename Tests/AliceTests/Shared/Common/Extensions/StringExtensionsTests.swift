//
//  StringExtensionsTests.swift
//  Alice
//
//  Created by Javier Cicchelli on 16/04/2019.
//

import XCTest
import Foundation

@testable import Alice

class StringExtensionsTests: XCTestCase {

	// MARK: Static
	
	static var allTests = [
		("testAsURL", testAsURL),
	]
	
	// MARK: Functions
	
    func testAsURL() {
		XCTAssertNil("".asURL())
		XCTAssertEqual("something".asURL(), URL(string: "something"))	
		XCTAssertEqual("https://www.google.com".asURL(), URL(string: "https://www.google.com"))
    }

}
