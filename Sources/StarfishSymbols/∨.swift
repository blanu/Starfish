//
//  ∨.swift
//  
//
//  Created by Dr. Brandon Wiley on 2/2/22.
//

import Foundation
import Starfish

prefix operator ∨
infix operator ∨

// Or
public func ∨(_ x: Bool, _ y: Bool) -> Bool
{
    or(x, y)
}

public func ∨(_ x: [Bool], _ y: Bool) -> [Bool]
{
    or(x, y)
}

public func ∨(_ x: Bool, _ y: [Bool]) -> [Bool]
{
    or(x, y)
}

public func ∨(_ x: [Bool], _ y: [Bool]) throws -> [Bool]
{
    try or(x, y)
}

// GCD
public func ∨<T>(_ x: T, _ y: T) -> T where T: BinaryInteger
{
    gcd(x, y)
}

public func ∨<T>(_ x: [T], _ y: T) -> [T] where T: BinaryInteger
{
    gcd(x, y)
}

public func ∨<T>(_ x: T, _ y: [T]) -> [T] where T: BinaryInteger
{
    gcd(x, y)
}

public func ∨<T>(_ x: [T], _ y: [T]) throws -> [T] where T: BinaryInteger
{
    try gcd(x, y)
}
