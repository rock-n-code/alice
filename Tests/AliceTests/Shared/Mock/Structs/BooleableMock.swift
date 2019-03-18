//
//  BooleableMock.swift
//  Alice
//
//  Created by Javier Cicchelli on 18/03/2019.
//

import Alice

internal struct BooleableMock {
	
	// MARK: Properties
	
	private let value: Bool
	
}

// MARK: - Booleable

extension BooleableMock: Booleable {
	
	// MARK: Initializers
	
	init(bool: Bool) {
		self.value = bool
	}
	
	// MARK: Functions
	
	func asBool() -> Bool {
		return value
	}
	
}
