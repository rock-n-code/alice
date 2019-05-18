//
//  NSPersistentStoreDescriptionExtensionsTests.swift
//  Alice
//
//  Created by Javier Cicchelli on 17/04/2019.
//

import XCTest
import CoreData

@testable import Alice

class NSPersistentStoreDescriptionExtensionsTests: XCTestCase {

	// MARK: Static
	
	static var allTests = [
		("testMakeForModelOfTypeSQL", testMakeForModelOfTypeSQL),
		("testMakeForModelOfTypeInMemory", testMakeForModelOfTypeInMemory),
		("testMakeDefaultForModelOfType", testMakeDefaultForModelOfType),
	]
	
	// MARK: Static tests
	
    func testMakeForModelOfTypeSQL() {
		let description = NSPersistentStoreDescription.make(forModel: .test,
															ofType: .sql)
		
		XCTAssertNotNil(description)
		XCTAssertEqual(description.type, DataStack.Store.sql.rawValue)
		XCTAssertNotNil(description.url)
		XCTAssertEqual(description.url?.lastPathComponent, "Test.sqlite")
    }
	
	func testMakeForModelOfTypeInMemory() {
		let description = NSPersistentStoreDescription.make(forModel: .test,
															ofType: .inMemory)
		
		XCTAssertNotNil(description)
		XCTAssertEqual(description.type, DataStack.Store.inMemory.rawValue)
		XCTAssertNotNil(description.url)
		XCTAssertEqual(description.url?.absoluteString, "file:///dev/null")
	}
	
	func testMakeDefaultForModelOfType() {
		let description = NSPersistentStoreDescription.makeDefault(forModel: .test,
																   ofType: .binary)
		
		XCTAssertEqual(description.configuration, "Default")
		XCTAssertFalse(description.isReadOnly)
		XCTAssertFalse(description.shouldAddStoreAsynchronously)
		XCTAssertTrue(description.shouldInferMappingModelAutomatically)
		XCTAssertTrue(description.shouldMigrateStoreAutomatically)
	}

}
