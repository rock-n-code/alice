//
//  Script.swift
//  Alice
//
//  Created by Javier Cicchelli on 03/03/2019.
//

import Foundation

public protocol Script {
	
	// MARK: Properties
	
	var bundle: Bundle { get }
	var name: String { get }
	var type: String { get }
	var arguments: [String] { get }
	
}

// MARK: -

public extension Script {
	
	// MARK: Properties
	
	var path: String? {
		return bundle.path(forResource: name,
						   ofType: type)
	}
	
}
