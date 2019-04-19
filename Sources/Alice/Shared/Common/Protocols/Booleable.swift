//
//  Booleable.swift
//  Alice
//
//  Created by Javier Cicchelli on 18/03/2019.
//

/// Protocol to add functionality with `Bool` instances.
public protocol Booleable {
	
	// MARK: Initializers
	
	/// Initialize an instance based on a boolean value.
	///
	/// - Parameter bool: A boolean value to use during initialization.
	init(bool: Bool)
	
	// MARK: Functions

	/// Converts an instance into a boolean representation.
	///
	/// - Returns: A boolean instance that represents an object.
	func asBool() -> Bool
	
}
