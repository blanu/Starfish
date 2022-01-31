//
//  Not.swift
//  
//
//  Created by Dr. Brandon Wiley on 1/7/22.
//

import Foundation

public func not(_ x: Bool) -> Bool
{
    return !x
}

public func not<T>(_ x: T) -> Bool where T: BinaryInteger
{
    return x == 0
}

public func not<F>(_ x: F) -> Bool where F: FloatingPoint
{
    return x == 0
}

public func not(_ x: [Bool]) -> [Bool]
{
    return x.map(not)
}

public func not<T>(_ x: [T]) -> [Bool] where T: BinaryInteger
{
    return x.map(not)
}

public func not<F>(_ x: [F]) -> [Bool] where F: FloatingPoint
{
    return x.map(not)
}
