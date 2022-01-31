//
//  *.swift
//  
//
//  Created by Dr. Brandon Wiley on 1/31/22.
//

import Foundation
import Starfish
import Numerics

prefix operator *
infix operator *

// Exponential
public prefix func *<T>(_ a: T) -> Double where T: BinaryInteger
{
    return exponential(a)
}

public prefix func *<T>(_ `as`: [T]) -> [Double] where T: BinaryInteger
{
    return exponential(`as`)
}

public prefix func *<T>(_ a: T) -> Float where T: BinaryInteger
{
    return exponential(a)
}

public prefix func *<T>(_ `as`: [T]) -> [Float] where T: BinaryInteger
{
    return exponential(`as`)
}

// Power
public func *<T>(_ a: T, _ b: T) -> T where T: BinaryInteger
{
    return power(a, b)
}

public func *<T>(_ `as`: [T], _ b: T) -> [T] where T: BinaryInteger
{
    return power(`as`, b)
}

public func *<T>(_ a: T, _ bs: [T]) -> [T] where T: BinaryInteger
{
    return power(a, bs)
}

public func *<T>(_ `as`: [T], _ bs: [T]) -> [T] where T: BinaryInteger
{
    return power(`as`, bs)
}
