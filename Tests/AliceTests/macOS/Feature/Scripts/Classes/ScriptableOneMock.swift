//
//  ScriptableOneMock.swift
//  Alice
//
//  Created by Javier Cicchelli on 03/03/2019.
//

import Alice

internal class ScriptableOneMock: Scriptable {
	
	// MARK: Properties
	
	var script: Script
	
	// MARK: Initializers
	
	internal init() {
		self.script = TestOneScriptMock()
	}
	
}
