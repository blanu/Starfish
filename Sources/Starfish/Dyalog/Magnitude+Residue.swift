//
//  Magnitude+Residue.swift
//
//
//  Created by Dr. Brandon Wiley on 11/13/21.
//

import Foundation
import Numerics

// Magnitude
public func magnitude<T>(_ a: T) -> T where T: SignedNumeric, T: Comparable
{
    return abs(a)
}

public func magnitude<T>(_ `as`: [T]) -> [T] where T: SignedNumeric, T: Comparable
{
    `as`.map
    {
        a in

        return abs(a)
    }
}

// Residue
public func residue<T>(_ a: T, _ b: T) -> T where T: BinaryInteger
{
    return a % b
}

public func residue<T>(_ `as`: [T], _ b: T) -> [T] where T: BinaryInteger
{
    return `as`.map
    {
        a in

        return a % b
    }
}

public func residue<T>(_ a: T, _ bs: [T]) -> [T] where T: BinaryInteger
{
    return bs.map
    {
        b in

        return a % b
    }
}

public func residue<T>(_ `as`: [T], _ bs: [T]) -> [T] where T: BinaryInteger
{
    let zipped = zip(`as`, bs)
    return zipped.map
    {
        (a, b) in

        return a % b
    }
}
