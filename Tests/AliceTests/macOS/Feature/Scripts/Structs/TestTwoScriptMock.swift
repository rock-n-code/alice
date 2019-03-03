//
//  TestTwoScriptMock.swift
//  Alice
//
//  Created by Javier Cicchelli on 03/03/2019.
//

import Foundation
import Alice

internal struct TestTwoScriptMock {}

// MARK: - Script

extension TestTwoScriptMock: Script {
	
	// MARK: Properties
	
	var bundle: Bundle {
		return Bundle(for: ScriptTests.self)
	}
	
	var name: String {
		return "AnotherScript"
	}
	
	var type: String {
		return "sh"
	}
	
	var arguments: [String] {
		return ["hello"]
	}
	
}

