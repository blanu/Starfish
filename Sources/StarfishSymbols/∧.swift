//
//  ∧.swift
//  
//
//  Created by Dr. Brandon Wiley on 2/2/22.
//

import Foundation
import Starfish

prefix operator ∧
infix operator ∧

// And
public func ∧(_ x: Bool, _ y: Bool) -> Bool
{
    and(x, y)
}

public func ∧(_ x: [Bool], _ y: Bool) -> [Bool]
{
    and(x, y)
}

public func ∧(_ x: Bool, _ y: [Bool]) -> [Bool]
{
    and(x, y)
}

public func ∧(_ x: [Bool], _ y: [Bool]) throws -> [Bool]
{
    try and(x, y)
}

// LCM
public func ∧<T>(_ x: T, _ y: T) -> T where T: BinaryInteger
{
    lcm(x, y)
}

public func ∧<T>(_ x: [T], _ y: T) -> [T] where T: BinaryInteger
{
    lcm(x, y)
}

public func ∧<T>(_ x: T, _ y: [T]) -> [T] where T: BinaryInteger
{
    lcm(x, y)
}

public func ∧<T>(_ x: [T], _ y: [T]) throws -> [T] where T: BinaryInteger
{
    try lcm(x, y)
}
