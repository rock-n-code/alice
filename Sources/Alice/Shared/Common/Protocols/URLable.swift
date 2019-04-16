//
//  URLable.swift
//  Alice
//
//  Created by Javier Cicchelli on 16/04/2019.
//

import Foundation

/// Protocol to add functionality with `URL` instances.
public protocol URLable {
	
	// MARK: Functions
	
	/// Converts an instance into its URL representation.
	///
	/// - Returns: A `URL` instance that represents an object.
	func asURL() -> URL?
	
}
