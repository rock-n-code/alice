//
//  Identifiable.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 06/09/2018.
//  Copyright © 2018 Rock & Code. All rights reserved.
//

public protocol Identifiable {}

// MARK: -

public extension Identifiable {
	
	// MARK: Static
	
	/// Returns the name of the class.
	static func identify() -> String {
		return String(describing: self)
	}
	
	// MARK: Functions
	
	/// Returns the instance's name of the class.
	func identify() -> String {
		return String(describing: type(of: self))
	}
	
}
