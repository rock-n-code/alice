//
//  PausableMock.swift
//  Alice
//
//  Created by Javier Cicchelli on 20/04/2019.
//

import Alice

internal class PausableMock {
	
	// MARK: Properties
	
	internal var isPaused = false

}

// MARK: - Pauseable

extension PausableMock: Pauseable {
	
	// MARK: Functions
	
	func pause() {
		isPaused = true
	}
	
}
