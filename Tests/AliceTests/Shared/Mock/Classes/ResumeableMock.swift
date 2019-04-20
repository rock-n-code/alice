//
//  ResumeableMock.swift
//  Alice
//
//  Created by Javier Cicchelli on 20/04/2019.
//

import Alice

internal class ResumeableMock {
	
	// MARK: Properties
	
	internal var isResumed = false
	
}

// MARK: - Resumeable

extension ResumeableMock: Resumeable {
	
	// MARK: Functions
	
	func resume() {
		isResumed = true
	}
	
}
