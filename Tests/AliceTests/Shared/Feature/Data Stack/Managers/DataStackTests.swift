//
//  DataStackTests.swift
//  Alice
//
//  Created by Javier Cicchelli on 18/04/2019.
//

import XCTest
import Foundation
import CoreData

@testable import Alice

class DataStackTests: XCTestCase {
	
	// MARK: Constants
	
	private let manager = DataStack.shared
	private let currentBundle = Bundle(for: DataStackTests.self)

	// MARK: Static
	
	static var allTests = [
		("testInit", testInit),
		("testShared", testShared),
		("testAddModelOfTypeSQL", testAddModelOfTypeSQL),
		("testAddModelOfTypeXML", testAddModelOfTypeXML),
		("testAddModelOfTypeBinary", testAddModelOfTypeBinary),
		("testAddModelOfTypeInMemory", testAddModelOfTypeInMemory),
		("testAddModelWithDescriptions", testAddModelWithDescriptions),
		("testAddEmptyModel", testAddEmptyModel),
		("testAddUnknownModel", testAddUnknownModel),
		("testAddExistingModel", testAddExistingModel),
		("testAddModelNotInBundle", testAddModelNotInBundle),
		("testRemoveModel", testRemoveModel),
		("testRemoveEmptyModel", testRemoveEmptyModel),
		("testRemoveUnknownModel", testRemoveUnknownModel),
		("testGetForegroundContextFromModel", testGetForegroundContextFromModel),
		("testGetBackgroundContextFromModel", testGetBackgroundContextFromModel),
		("testGetContextFromEmptyModel", testGetContextFromEmptyModel),
		("testGetContextFromUnknownModel", testGetContextFromUnknownModel),
		("testSave", testSave),
		("testIsAddedModel", testIsAddedModel),
		("testIsAddedEmptyModel", testIsAddedEmptyModel),
		("testIsAddedUnknownModel", testIsAddedUnknownModel),
	]

	// MARK: Setup
	
    override func setUp() {
		super.setUp()
    }

    override func tearDown() {
		try? manager.remove(.test)

		super.tearDown()
    }
	
	// MARK: Initializers tests
	
	func testInit() {
		let dataStack = DataStack()
		
		XCTAssertNotNil(dataStack)
		XCTAssertTrue(dataStack.containers.isEmpty)
	}
	
	// MARK: Static tests
	
	func testShared() {
		XCTAssertNotNil(DataStack.shared)
	}
	
	// MARK: Functions tests
	
	func testAddModelOfTypeSQL() {
		XCTAssertFalse(manager.isAdded(.test))
		XCTAssertNoThrow(try manager.add(.test,
										 ofType: .sql,
										 fromBundle: currentBundle))
		XCTAssertTrue(manager.isAdded(.test))
	}
	
	func testAddModelOfTypeXML() {
		XCTAssertFalse(manager.isAdded(.test))
		XCTAssertNoThrow(try manager.add(.test,
										 ofType: .xml,
										 fromBundle: currentBundle))
		XCTAssertTrue(manager.isAdded(.test))
	}
	
	func testAddModelOfTypeBinary() {
		XCTAssertFalse(manager.isAdded(.test))
		XCTAssertNoThrow(try manager.add(.test,
										 ofType: .binary,
										 fromBundle: currentBundle))
		XCTAssertTrue(manager.isAdded(.test))
	}
	
	func testAddModelOfTypeInMemory() {
		XCTAssertFalse(manager.isAdded(.test))
		XCTAssertNoThrow(try manager.add(.test,
										 ofType: .inMemory,
										 fromBundle: currentBundle))
		XCTAssertTrue(manager.isAdded(.test))
	}
	
	func testAddModelWithDescriptions() {
		XCTAssertFalse(manager.isAdded(.test))
		XCTAssertNoThrow(try manager.add(.test,
										 ofType: .sql,
										 fromBundle: currentBundle,
										 withDescriptions: [.makeDefault(forModel: .test,
																		 ofType: .sql)]))
		XCTAssertTrue(manager.isAdded(.test))
	}
	
	func testAddEmptyModel() {
		XCTAssertThrowsError(try manager.add(.empty,
											 ofType: .sql,
											 fromBundle: currentBundle)) { error in
			XCTAssertEqual(error as? DataStackError, .containerNameIsEmpty)
		}
	}
	
	func testAddUnknownModel() {
		XCTAssertThrowsError(try manager.add(.unknown,
											 ofType: .sql,
											 fromBundle: currentBundle)) { error in
			XCTAssertEqual(error as? DataStackError, .objectModelNotFound)
		}
	}
	
	func testAddExistingModel() {
		XCTAssertNoThrow(try manager.add(.test,
										 ofType: .sql,
										 fromBundle: currentBundle))
		XCTAssertThrowsError(try manager.add(.test,
											 ofType: .sql,
											 fromBundle: currentBundle)) { error in
			XCTAssertEqual(error as? DataStackError, .containerNameExists)
		}
	}
	
	func testAddModelNotInBundle() {
		XCTAssertThrowsError(try manager.add(.test,
											 ofType: .sql,
											 fromBundle: Bundle(for: DataStack.self))) { error in
			XCTAssertEqual(error as? DataStackError, .objectModelNotFound)
		}
	}
	
	func testRemoveModel() {
		XCTAssertNoThrow(try manager.add(.test,
										 ofType: .sql,
										 fromBundle: currentBundle))
		XCTAssertNoThrow(try manager.remove(.test))
		XCTAssertFalse(manager.isAdded(.test))
	}
	
	func testRemoveEmptyModel() {
		XCTAssertThrowsError(try manager.remove(.empty)) { error in
			XCTAssertEqual(error as? DataStackError, .containerNameIsEmpty)
		}
	}
	
	func testRemoveUnknownModel() {
		XCTAssertThrowsError(try manager.remove(.unknown)) { error in
			XCTAssertEqual(error as? DataStackError, .containerNameNotExists)
		}
	}
	
	func testGetForegroundContextFromModel() {
		XCTAssertNoThrow(try manager.add(.test,
										 ofType: .sql,
										 fromBundle: currentBundle))
		XCTAssertNoThrow(try manager.getContext(ofType: .foreground,
												fromModel: .test))
	}
	
	func testGetBackgroundContextFromModel() {
		XCTAssertNoThrow(try manager.add(.test,
										 ofType: .sql,
										 fromBundle: currentBundle))
		XCTAssertNoThrow(try manager.getContext(ofType: .background,
												fromModel: .test))
	}
	
	func testGetContextFromEmptyModel() {
		XCTAssertThrowsError(try manager.getContext(ofType: .foreground,
													fromModel: .empty)) { error in
			XCTAssertEqual(error as? DataStackError, .containerNameIsEmpty)
		}
	}
	
	func testGetContextFromUnknownModel() {
		XCTAssertThrowsError(try manager.getContext(ofType: .background,
													fromModel: .unknown)) { error in
			XCTAssertEqual(error as? DataStackError, .containerNameNotExists)
		}
	}

	func testSave() {
		XCTAssertNoThrow(try manager.add(.test,
										 ofType: .sql,
										 fromBundle: currentBundle))
		guard let context = try? manager.getContext(ofType: .foreground,
													fromModel: .test) else {
			XCTFail()
			return
		}
		
		let test = Test(context: context)
		
		test.date = Date()
		
		XCTAssertTrue(context.hasChanges)
		XCTAssertNoThrow(try manager.save())
		XCTAssertFalse(context.hasChanges)
	}

	func testIsAddedModel() {
		XCTAssertNoThrow(try manager.add(.test,
										 ofType: .sql,
										 fromBundle: currentBundle))
		XCTAssertTrue(manager.isAdded(.test))
	}
	
	func testIsAddedEmptyModel() {
		XCTAssertFalse(manager.isAdded(.empty))
	}
	
	func testIsAddedUnknownModel() {
		XCTAssertFalse(manager.isAdded(.unknown))
	}

}
