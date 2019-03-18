//
//  TestOneScriptMock.swift
//  Alice
//
//  Created by Javier Cicchelli on 03/03/2019.
//

import Foundation
import Alice

internal struct TestOneScriptMock: Script {
	
	// MARK: Properties
	
	var bundle: Bundle {
		return Bundle(for: ScriptTests.self)
	}
	
	var name: String {
		return "TestScript"
	}
	
	var type: String {
		return "command"
	}
	
	var arguments: [String] {
		return []
	}

}
