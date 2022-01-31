//
//  ×.swift
//  
//
//  Created by Dr. Brandon Wiley on 1/31/22.
//

import Foundation
import Starfish
import Numerics

prefix operator ×
infix operator ×

public prefix func ×<T>(_ a: T) -> T where T: BinaryInteger
{
    return direction(a)
}

public prefix func ×<T>(_ `as`: [T]) -> [T] where T: BinaryInteger
{
    return direction(`as`)
}

public prefix func ×<T>(_ c: Complex<T>) -> Complex<T>
{
    return direction(c)
}

public prefix func ×<T>(_ cs: [Complex<T>]) -> [Complex<T>]
{
    return direction(cs)
}

// Times
public func ×<T>(_ a: T, _ b: T) -> T where T: Numeric
{
    return times(a, b)
}

public func ×<T>(_ `as`: [T], _ b: T) -> [T] where T: Numeric
{
    return times(`as`, b)
}

public func ×<T>(_ a: T, _ bs: [T]) -> [T] where T: Numeric
{
    return times(a, bs)
}

public func ×<T>(_ `as`: [T], _ bs: [T]) -> [T] where T: Numeric
{
    return times(`as`, bs)
}
