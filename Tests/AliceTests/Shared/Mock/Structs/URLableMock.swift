//
//  URLableMock.swift
//  Alice
//
//  Created by Javier Cicchelli on 16/04/2019.
//

import Foundation
import Alice

internal struct URLableMock {}

// MARK: - URLable

extension URLableMock: URLable {
	
	// MARK: Functions
	
	func asURL() -> URL? {
		return URL(string: "https://www.google.com")
	}

}
