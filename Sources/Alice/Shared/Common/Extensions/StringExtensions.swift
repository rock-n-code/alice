//
//  StringExtensions.swift
//  Alice
//
//  Created by Javier Cicchelli on 16/04/2019.
//

import Foundation

// MARK: - URLable

extension String: URLable {
	
	// MARK: Functions
	
	public func asURL() -> URL? {
		return URL(string: self)
	}

}
