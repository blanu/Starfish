//
//  ⍱.swift
//  
//
//  Created by Dr. Brandon Wiley on 2/2/22.
//

import Foundation
import Starfish

prefix operator ⍱
infix operator ⍱

// Nand
public func ⍱(_ x: Bool, _ y: Bool) -> Bool
{
    nor(x, y)
}

public func ⍱(_ x: [Bool], _ y: Bool) -> [Bool]
{
    nor(x, y)
}

public func ⍱(_ x: Bool, _ y: [Bool]) -> [Bool]
{
    nor(x, y)
}

public func ⍱(_ x: [Bool], _ y: [Bool]) throws -> [Bool]
{
    try nor(x, y)
}

