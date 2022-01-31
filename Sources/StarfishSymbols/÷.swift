//
//  ÷.swift
//  
//
//  Created by Dr. Brandon Wiley on 1/31/22.
//

import Foundation
import Starfish
import Numerics

infix operator ÷
prefix operator ÷

// Reciprocal
public prefix func ÷<T,F>(_ a: T) -> F where T: BinaryInteger, F: FloatingPoint
{
    return reciprocal(a)
}

public prefix func ÷<T,F>(_ `as`: [T]) -> [F] where T: BinaryInteger, F: FloatingPoint
{
    return reciprocal(`as`)
}

public prefix func ÷<T>(_ c: Complex<T>) -> Complex<T>
{
    return reciprocal(c)
}

public prefix func ÷<T>(_ cs: [Complex<T>]) -> [Complex<T>]
{
    return reciprocal(cs)
}

// Divide
public func ÷<T,F>(_ a: T, _ b: T) -> F where T: BinaryInteger, F: FloatingPoint
{
    return divide(a, b)
}

public func ÷<T,F>(_ `as`: [T], _ b: T) -> [F] where T: BinaryInteger, F: FloatingPoint
{
    return divide(`as`, b)
}

public func ÷<T,F>(_ a: T, _ bs: [T]) -> [F] where T: BinaryInteger, F: FloatingPoint
{
    return divide(a, bs)
}

public func ÷<T,F>(_ `as`: [T], _ bs: [T]) -> [F] where T: BinaryInteger, F: FloatingPoint
{
    return divide(`as`, bs)
}
