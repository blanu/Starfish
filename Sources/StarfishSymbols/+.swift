//
//  +.swift
//  
//
//  Created by Dr. Brandon Wiley on 1/31/22.
//

import Foundation
import Starfish
import Numerics

prefix operator +
infix operator +

// Conjugate
public prefix func +<T>(_ a: T) -> T where T: AdditiveArithmetic
{
    return conjugate(a)
}

public prefix func +<T>(_ `as`: [T]) -> [T] where T: AdditiveArithmetic
{
    return conjugate(`as`)
}

public prefix func +<T>(_ c: Complex<T>) -> Complex<T>
{
    return conjugate(c)
}

public prefix func +<T>(_ cs: [Complex<T>]) -> [Complex<T>]
{
    return conjugate(cs)
}

// Plus
public func +<T>(_ a: T, _ b: T) -> T where T: AdditiveArithmetic
{
    return plus(a, b)
}

public func +<T>(_ `as`: [T], _ b: T) -> [T] where T: AdditiveArithmetic
{
    return plus(`as`, b)
}

public func +<T>(_ a: T, _ bs: [T]) -> [T] where T: AdditiveArithmetic
{
    return plus(a, bs)
}

public func +<T>(_ `as`: [T], _ bs: [T]) -> [T] where T: AdditiveArithmetic
{
    return plus(`as`, bs)
}

