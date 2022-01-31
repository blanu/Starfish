//
//  |.swift
//  
//
//  Created by Dr. Brandon Wiley on 1/31/22.
//

import Foundation
import Starfish
import Numerics

prefix operator |
infix operator |

// Magnitude
public prefix func |<T>(_ a: T) -> T where T: SignedNumeric, T: Comparable
{
    return magnitude(a)
}

public prefix func |<T>(_ `as`: [T]) -> [T] where T: SignedNumeric, T: Comparable
{
    return magnitude(`as`)
}

// Residue
public func |<T>(_ a: T, _ b: T) -> T where T: BinaryInteger
{
    return residue(a, b)
}

public func |<T>(_ `as`: [T], _ b: T) -> [T] where T: BinaryInteger
{
    return residue(`as`, b)
}

public func |<T>(_ a: T, _ bs: [T]) -> [T] where T: BinaryInteger
{
    return residue(a, bs)
}

public func |<T>(_ `as`: [T], _ bs: [T]) -> [T] where T: BinaryInteger
{
    return residue(`as`, bs)
}
