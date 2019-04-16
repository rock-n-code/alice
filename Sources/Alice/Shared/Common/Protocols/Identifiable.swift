//
//  Identifiable.swift
//  Alice
//
//  Created by Javier Cicchelli on 06/09/2018.
//  Copyright © 2018 Rock & Code. All rights reserved.
//

/// Protocol to identify the class name of a class or an instance.
public protocol Identifiable {}

// MARK: -

public extension Identifiable {
	
	// MARK: Static
	
	/// Retrieves the class name of a class.
	///
	/// - Returns: A string value that represents the name of the class.
	static func identify() -> String {
		return String(describing: self)
	}
	
	// MARK: Functions
	
	/// Retrieves the class name of an instance.
	///
	/// - Returns: A string value that represents the name of the class.
	func identify() -> String {
		return String(describing: type(of: self))
	}
	
}
