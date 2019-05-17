//
//  DataStackStoreTests.swift
//  Alice
//
//  Created by Javier Cicchelli on 17/04/2019.
//

import XCTest
import CoreData

@testable import Alice

class DataStackStoreTests: XCTestCase {

	// MARK: Static
	
	static var allTests = [
		("testRawValue", testRawValue),
		("testExtensionValue", testExtensionValue),
	]
	
	// MARK: Setup
	
    override func setUp() {
		super.setUp()
    }

    override func tearDown() {
		super.tearDown()
    }

	// MARK: Properties tests
	
	func testRawValue() {
		XCTAssertEqual(DataStack.Store.sql.rawValue, NSSQLiteStoreType)
		XCTAssertEqual(DataStack.Store.binary.rawValue, NSBinaryStoreType)
		XCTAssertEqual(DataStack.Store.inMemory.rawValue, NSInMemoryStoreType)
		
		#if os(macOS)
		XCTAssertEqual(DataStack.Store.xml.rawValue, NSXMLStoreType)
		#else
		XCTAssertEqual(DataStack.Store.xml.rawValue, NSSQLiteStoreType)
		#endif
	}
	
	func testExtensionValue() {
		XCTAssertEqual(DataStack.Store.sql.extensionValue, "sqlite")
		XCTAssertEqual(DataStack.Store.binary.extensionValue, "bin")
		XCTAssertEqual(DataStack.Store.inMemory.extensionValue, "")
		
		#if os(macOS)
		XCTAssertEqual(DataStack.Store.xml.extensionValue, "xml")
		#else
		XCTAssertEqual(DataStack.Store.xml.extensionValue, "sqlite")
		#endif
	}

}
