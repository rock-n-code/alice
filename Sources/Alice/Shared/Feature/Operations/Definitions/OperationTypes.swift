//
//  OperationTypes.swift
//  Alice
//
//  Created by Javier Cicchelli on 20/04/2019.
//

public typealias PauseableOperation = Pauseable
public typealias ResumeableOperation = Resumeable
public typealias ControlableOperation = PauseableOperation & ResumeableOperation
