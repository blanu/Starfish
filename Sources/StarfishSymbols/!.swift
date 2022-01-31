//
//  !.swift
//  
//
//  Created by Dr. Brandon Wiley on 1/31/22.
//

import Foundation
import Starfish
import Numerics

prefix operator !
infix operator !

// Exponential
public prefix func !<T>(_ a: T) -> T where T: BinaryInteger
{
    return factorial(a)
}

public prefix func !<T>(_ `as`: [T]) -> [T] where T: BinaryInteger
{
    return factorial(`as`)
}

public prefix func !<F,T>(_ a: T) -> F where T: BinaryInteger, F: FloatingPoint
{
    return factorial(a)
}

public prefix func !<F,T>(_ `as`: [T]) -> [F] where T: BinaryInteger, F: FloatingPoint
{
    return factorial(`as`)
}

// Binomial
public func !<F,T>(_ k: T, _ n: T) -> F where T: BinaryInteger, F: FloatingPoint
{
    return binomial(k, n)
}

public func !<F,T>(_ `as`: [T], _ b: T) -> [F] where T: BinaryInteger, F: FloatingPoint
{
    return binomial(`as`, b)
}

public func !<F,T>(_ a: T, _ bs: [T]) -> [F] where T: BinaryInteger, F: FloatingPoint
{
    return binomial(a, bs)
}

public func !<F,T>(_ `as`: [T], _ bs: [T]) -> [F] where T: BinaryInteger, F: FloatingPoint
{
    return binomial(`as`, bs)
}
